const INDENT = '  '

function findMatchingClose(s: string, openParenIdx: number): number {
  let depth = 0
  let inStr: string | null = null
  for (let i = openParenIdx; i < s.length; i++) {
    const c = s[i]
    if (inStr) {
      if (c === inStr)
        inStr = null
      continue
    }
    if (c === '\'' || c === '"') {
      inStr = c
      continue
    }
    if (c === '(') {
      depth++
    }
    else if (c === ')') {
      depth--
      if (depth === 0)
        return i
    }
  }
  return -1
}

function splitTopLevelLogical(body: string): Array<{ arg: string, op?: 'and' | 'or' }> {
  const out: Array<{ arg: string, op?: 'and' | 'or' }> = []
  let depth = 0
  let inStr: string | null = null
  let last = 0
  let i = 0
  while (i < body.length) {
    const c = body[i]
    if (inStr) {
      if (c === inStr)
        inStr = null
      i++
      continue
    }
    if (c === '\'' || c === '"') {
      inStr = c
      i++
      continue
    }
    if (c === '(') {
      depth++
      i++
      continue
    }
    if (c === ')') {
      depth--
      i++
      continue
    }
    if (depth === 0) {
      if (body.startsWith(' and ', i)) {
        out.push({ arg: body.slice(last, i).trim(), op: 'and' })
        i += 5
        last = i
        continue
      }
      if (body.startsWith(' or ', i)) {
        out.push({ arg: body.slice(last, i).trim(), op: 'or' })
        i += 4
        last = i
        continue
      }
    }
    i++
  }
  if (last < body.length)
    out.push({ arg: body.slice(last).trim() })
  return out
}

function splitTopLevelCommas(body: string): string[] {
  const out: string[] = []
  let depth = 0
  let inStr: string | null = null
  let last = 0
  for (let i = 0; i < body.length; i++) {
    const c = body[i]
    if (inStr) {
      if (c === inStr)
        inStr = null
      continue
    }
    if (c === '\'' || c === '"') {
      inStr = c
      continue
    }
    if (c === '(') {
      depth++
    }
    else if (c === ')') {
      depth--
    }
    else if (c === ',' && depth === 0) {
      out.push(body.slice(last, i).trim())
      last = i + 1
    }
  }
  out.push(body.slice(last).trim())
  return out
}

function formatWhereBody(body: string, bodyIndent: string): string {
  const parts = splitTopLevelLogical(body.trim())
  if (parts.length <= 1)
    return body.trim()
  return parts
    .map(({ arg, op }) => (op ? `${arg} ${op}` : arg))
    .join(`\n${bodyIndent}`)
}

function indentBlock(s: string, indent: string): string {
  return s
    .split('\n')
    .map(line => (line.length > 0 ? indent + line : line))
    .join('\n')
}

export function formatFhirPath(raw: string): string {
  let out = ''
  let i = 0
  let depth = 0
  let inStr: string | null = null

  while (i < raw.length) {
    const c = raw[i]
    if (inStr) {
      out += c
      if (c === inStr)
        inStr = null
      i++
      continue
    }
    if (c === '\'' || c === '"') {
      inStr = c
      out += c
      i++
      continue
    }

    if (depth === 0 && raw.startsWith('iif(', i)) {
      const open = i + 'iif'.length
      const close = findMatchingClose(raw, open)
      if (close !== -1) {
        const body = raw.slice(open + 1, close)
        const args = splitTopLevelCommas(body)
        const formattedArgs = args.map(arg => indentBlock(formatFhirPath(arg), INDENT))
        out += `iif(\n${formattedArgs.join(',\n')}\n)`
        i = close + 1
        continue
      }
    }

    if (depth === 0 && raw.startsWith('.where(', i)) {
      const open = i + '.where'.length
      const close = findMatchingClose(raw, open)
      if (close !== -1) {
        const body = raw.slice(open + 1, close)
        const bodyIndent = INDENT + INDENT
        const formattedBody = formatWhereBody(body, bodyIndent)
        out += `\n${INDENT}.where(\n${bodyIndent}${formattedBody}\n${INDENT})`
        i = close + 1
        continue
      }
    }

    if (c === '(')
      depth++
    else if (c === ')')
      depth--
    out += c
    i++
  }

  return out
}
