import { z } from 'astro/zod'

function slugify(value: string) {
  return value.toLowerCase().replaceAll(/[^a-z0-9]+/g, '-').replaceAll(/^-|-$/g, '')
}

const fieldSchema = z.object({
  'Field Name': z.string().min(1),
  'Description': z.string().nullish(),
  'FHIR Resource': z.string().nullish(),
  'Coverage / Claim Type': z.array(z.string()).nullish(),
  'fhirPath': z.string().nullish(),
  'example': z.unknown(),
  'notes': z.string().nullish(),
  'sourceView': z.string().nullish(),
  'sourceColumn': z.string().nullish(),
  'bfdDerived': z.boolean().nullish(),
  'sources': z.array(z.string()).nullish(),
  'referenceTable': z.string().nullish().transform(v => v && v.trim().length > 0 ? v : null),
  'cclfMapping': z.array(z.string()).nullish(),
  'ccwMapping': z.array(z.string()).nullish(),
  'profiles': z.array(z.string()).nullish(),
}).transform(f => ({
  fieldName: f['Field Name'],
  description: f.Description,
  fhirResource: f['FHIR Resource'],
  coverageType: f['Coverage / Claim Type'],
  fhirPath: f.fhirPath,
  example: f.example,
  notes: f.notes,
  sourceView: f.sourceView,
  sourceColumn: f.sourceColumn,
  bfdDerived: f.bfdDerived,
  sources: f.sources,
  referenceTable: f.referenceTable,
  cclfMapping: f.cclfMapping,
  ccwMapping: f.ccwMapping,
  profiles: f.profiles,
}))

const dictionarySchema = z.object({
  version: z.string(),
  fields: z.array(fieldSchema),
})

export function parseDataDictionary(fileContent: string) {
  const parsed = dictionarySchema.safeParse(JSON.parse(fileContent))

  if (!parsed.success) {
    console.error(parsed.error.issues)
    throw new Error(`Failed to parse data dictionary`)
  }

  const seen = new Set<string>()
  return parsed.data.fields.map((val, index) => {
    const baseId = slugify(val.sourceColumn || val.fieldName)
    const id = seen.has(baseId) ? `${baseId}-${index}` : baseId
    seen.add(id)

    return {
      id,
      index,
      ...val,
    }
  })
}
