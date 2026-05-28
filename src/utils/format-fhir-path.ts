export interface FormattedFhirPath {
  formatted: string
  markers: string[]
  collapseRange: string | null
}

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

function formatWhereBody(body: string, bodyIndent: string): string {
  const parts = splitTopLevelLogical(body.trim())
  if (parts.length <= 1)
    return body.trim()
  return parts
    .map(({ arg, op }) => (op ? `${arg} ${op}` : arg))
    .join(`\n${bodyIndent}`)
}

function collectMarkers(raw: string): string[] {
  const markers: string[] = []
  const seen = new Set<string>()
  const re = /'([^']+)'/g
  let m: RegExpExecArray | null
  while ((m = re.exec(raw)) !== null) {
    const lit = m[1]
    if (seen.has(lit))
      continue
    seen.add(lit)
    // URLs get a neutral mark; non-URL literals (codes) get `ins` so they pop visually.
    if (lit.startsWith('http://') || lit.startsWith('https://')) {
      markers.push(`mark="${lit}"`)
    }
    else {
      markers.push(`ins="${lit}"`)
    }
  }
  return markers
}

export function formatFhirPath(raw: string): FormattedFhirPath {
  const markers = collectMarkers(raw)

  if (!raw.includes('.where(')) {
    return { formatted: raw, markers, collapseRange: null }
  }

  let out = ''
  let i = 0
  let depth = 0
  let inStr: string | null = null
  let firstBodyStartLine: number | null = null
  let firstBodyEndLine: number | null = null

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

    if (depth === 0 && raw.startsWith('.where(', i)) {
      const open = i + '.where'.length
      const close = findMatchingClose(raw, open)
      if (close === -1) {
        out += c
        i++
        continue
      }
      const body = raw.slice(open + 1, close)
      const bodyIndent = INDENT + INDENT
      const formattedBody = formatWhereBody(body, bodyIndent)

      out += `\n${INDENT}.where(\n${bodyIndent}`
      const startLine = out.split('\n').length
      out += formattedBody
      const endLine = out.split('\n').length
      out += `\n${INDENT})`

      if (firstBodyStartLine === null) {
        firstBodyStartLine = startLine
        firstBodyEndLine = endLine
      }
      i = close + 1
      continue
    }

    if (c === '(')
      depth++
    else if (c === ')')
      depth--
    out += c
    i++
  }

  const collapseRange
    = firstBodyStartLine !== null && firstBodyEndLine !== null
      ? `${firstBodyStartLine}-${firstBodyEndLine}`
      : null

  return { formatted: out, markers, collapseRange }
}
