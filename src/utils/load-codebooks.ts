import { z } from 'astro/zod'
import { XMLParser } from 'fast-xml-parser'
import { readFileSync } from 'node:fs'
import path from 'node:path'
import Papa from 'papaparse'
import { glob as tinyglobby } from 'tinyglobby'

function coerceToArray<T extends z.ZodTypeAny>(schema: T): z.ZodEffects<z.ZodArray<T>, z.infer<T>[], unknown> {
  return z.preprocess(v => Array.isArray(v) ? v : [v], z.array(schema))
}

const codeBookSchema = z.array(z.object({
  '@_id': z.string(),
  '@_label': z.string(),
  '@_shortName': z.string().optional(),
  '@_longName': z.string(),
  '@_type': z.string().optional(),
  '@_length': z.string(),
  '@_source': z.string().optional(),
  '@_valueFormat': z.string().optional(),
  'description': z.object({
    p: coerceToArray(z.string()),
  }),
  'comment': z.object({
    p: coerceToArray(z.string()),
  }).optional(),
  'valueGroups': z.object({
    valueGroup: coerceToArray(z.object({
      description: z.object({
        p: coerceToArray(z.string()),
      }).optional(),
      value: coerceToArray(z.object({
        '#text': z.coerce.string(),
        '@_code': z.string(),
      })),
    })),
  }).optional(),
}))

export async function loadCodebooks({ pattern, base }: { pattern: string | [string], base: string }) {
  const codebookFiles = await tinyglobby(pattern, {
    cwd: base,
    expandDirectories: false,
  })

  return codebookFiles.flatMap((cf) => {
    const filePath = path.join(base, cf)
    const fileContent = readFileSync(filePath, { encoding: 'utf-8' })

    const parser = new XMLParser({
      ignoreAttributes: false,
    })
    const data = parser.parse(fileContent)
    const parsed = codeBookSchema.safeParse(data.codebook.variable)

    if (!parsed.success) {
      console.error(parsed.error.errors)
      throw new Error(`Failed to parse: ${filePath} `)
    }
    else {
      return parsed.data.map(val => ({
        id: val['@_id'].toLowerCase(),
        title: val['@_id'],
        label: val['@_label'],
        shortName: val['@_shortName'],
        longName: val['@_longName'],
        type: val['@_type'],
        length: val['@_length'],
        source: val['@_source'],
        valueFormat: val['@_valueFormat'],
        description: val.description.p.join(' '),
        comment: val.comment?.p.join(' '),
        values: val.valueGroups?.valueGroup.flatMap(vg =>
          vg.value.map(v => ({
            code: v['@_code'],
            text: v['#text'],
          })),
        ),
      }))
    }
  })
}

function camelize(str: string) {
  return str
    .split(/[-_\s]+/)
    .map(
      (word, index) =>
        `${index === 0 ? word.charAt(0).toLowerCase() : word.charAt(0).toUpperCase()}${word.slice(1)}`,
    )
    .join('')
}

const csvSchema = z.array(z.object({
  'sourceSystem': z.string().nullable().optional().transform(v => v || ''),
  'fieldName': z.string().optional().transform(v => v || ''),
  'sourceCopybookFieldLabel': z.string().optional().transform(v => v || ''),
  'copybookDataDictionaryName(ifDifferent)': z.string().optional().transform(val => val === 'n/a' ? '' : val),
  'sourceSystemDefinition': z.string().nullable().optional().transform(v => v || ''),
  'versionAdded': z.coerce.string().transform(val => Number(val) || null),
}))

export async function loadCsvResources({ pattern, base }: { pattern: string | [string], base: string }) {
  const csvFiles = await tinyglobby(pattern, {
    cwd: base,
    expandDirectories: false,
  })

  return csvFiles.flatMap((cf) => {
    const filePath = path.join(base, cf)
    const fileContent = readFileSync(filePath, { encoding: 'utf-8' })

    const { data } = Papa.parse(fileContent, {
      dynamicTyping: true,
      header: true,
      transformHeader: camelize,
    })
    const parsed = csvSchema.safeParse(data)

    if (!parsed.success) {
      console.error(parsed.error.errors)
      throw new Error(`Failed to parse: ${filePath} `)
    }

    return parsed.data.map((d) => {
      const fieldLabel = d['copybookDataDictionaryName(ifDifferent)'] || d.sourceCopybookFieldLabel
      return {
        id: `${d.sourceSystem?.toLowerCase()}/${fieldLabel?.toLowerCase()}`,
        sourceSystem: d.sourceSystem,
        fieldName: d.fieldName,
        sourceField: d.sourceCopybookFieldLabel,
        altSourceField: d['copybookDataDictionaryName(ifDifferent)'],
        sourceDefinition: d.sourceSystemDefinition.split('\n'),
        versionAdded: d.versionAdded,
        fieldLabel,
      }
    })
  })
}
