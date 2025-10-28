import { z } from 'astro/zod'
import { readFileSync } from 'node:fs'
import path from 'node:path'
import Papa from 'papaparse'
import { glob as tinyglobby } from 'tinyglobby'

function camelize(str: string) {
  return str
    .split(/[-_\s]+/)
    .map(
      (word, index) =>
        `${index === 0 ? word.charAt(0).toLowerCase() : word.charAt(0).toUpperCase()}${word.slice(1)}`,
    )
    .join('')
}

const regex = /^[A-Z]+-[A-Z]+$/ // Matches HEY-THERE (UPPERCASE hyphen UPPERCASE)

const csvSchema = z.array(z.object({
  'sourceSystem': z.string().nullable().optional().transform(v => v || ''),
  'fieldName': z.string().optional().transform(v => v || ''),
  'sourceCopybookFieldLabel': z.string().optional().transform(v => v || ''),
  'copybookDataDictionaryName(ifDifferent)': z.string().optional().transform(val => regex.test(val || '') ? val : ''),
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
