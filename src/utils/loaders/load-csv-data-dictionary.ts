import { z } from 'astro/zod'
import { readFileSync } from 'node:fs'
import path from 'node:path'
import Papa from 'papaparse'
import { glob as tinyglobby } from 'tinyglobby'

const HEADER_MAP: Record<string, string> = {
  '': 'index',
  'Field Name': 'fieldName',
  'Description': 'description',
  'FHIR Resource': 'fhirResource',
  'Coverage / Claim Type': 'coverageType',
  'fhirPath': 'fhirPath',
  'example': 'example',
  'notes': 'notes',
  'sourceView': 'sourceView',
  'sourceColumn': 'sourceColumn',
  'bfdDerived': 'bfdDerived',
  'sources': 'sources',
  'referenceTable': 'referenceTable',
  'cclfMapping': 'cclfMapping',
  'ccwMapping': 'ccwMapping',
  'profiles': 'profiles',
}

const emptyToNull = (v: any) => (v && v.length > 0 ? v : null)

function parsePyList(v: any): any[] | null {
  if (v == null)
    return null
  const trimmed = v.trim()
  if (!trimmed)
    return null
  if (!trimmed.startsWith('[') || !trimmed.endsWith(']'))
    return null
  const inner = trimmed.slice(1, -1).trim()
  if (!inner)
    return null
  const items = inner
    .split(',')
    .map((s: any) => s.trim().replace(/^['"]|['"]$/g, '').trim())
    .filter((s: any) => s.length > 0)
  return items.length > 0 ? items : null
}

const pyList = z.string().optional().transform(parsePyList)

const csvSchema = z.array(z.object({
  index: z.coerce.number(),
  fieldName: z.string().min(1),
  description: z.string().optional().transform(emptyToNull),
  fhirResource: z.string().optional().transform(emptyToNull),
  coverageType: pyList,
  fhirPath: z.string().optional().transform(emptyToNull),
  example: z.string().optional().transform(emptyToNull),
  notes: z.string().optional().transform(emptyToNull),
  sourceView: z.string().optional().transform(emptyToNull),
  sourceColumn: z.string().optional().transform(emptyToNull),
  bfdDerived: z.string().optional().transform(emptyToNull),
  sources: pyList,
  referenceTable: z.string().optional().transform(emptyToNull),
  cclfMapping: pyList,
  ccwMapping: pyList,
  profiles: pyList,
}))

function slugify(value: string) {
  return value.toLowerCase().replace(/_/g, '-')
}

export async function loadCsvDataDictionary({ pattern, base }: { pattern: string | string[], base: string }) {
  const csvFiles = await tinyglobby(pattern, {
    cwd: base,
    expandDirectories: false,
  })

  return csvFiles.flatMap((cf) => {
    const filePath = path.join(base, cf)
    const fileContent = readFileSync(filePath, { encoding: 'utf-8' })

    const { data } = Papa.parse(fileContent, {
      header: true,
      skipEmptyLines: true,
      transformHeader: h => HEADER_MAP[h] ?? h,
    })
    const parsed = csvSchema.safeParse(data)

    if (!parsed.success) {
      console.error(parsed.error.issues)
      throw new Error(`Failed to parse: ${filePath} `)
    }

    const seen = new Set<string>()
    return parsed.data.map((d) => {
      const baseId = d.sourceColumn ? slugify(d.sourceColumn) : String(d.index)
      const id = seen.has(baseId) ? `${baseId}-${d.index}` : baseId
      seen.add(id)
      return { id, ...d }
    })
  })
}
