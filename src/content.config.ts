import { codeSystemSchema, structureDefinitionSchema } from '#utils/collections'
import { loadCodebooks } from '#utils/loaders/load-codebooks'
import { loadCsvResources } from '#utils/loaders/load-csv-resources'
import { dataDictionaryLoader } from '#utils/loaders/load-data-dictionary'
import { loadDataDictionaryCsv } from '#utils/loaders/load-data-dictionary-csv'
import { glob } from 'astro/loaders'
import { z } from 'astro/zod'
import { defineCollection } from 'astro:content'

const pageCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/pages',
  }),
  schema: z.object({
    title: z.string(),
    seo: z.object({
      description: z.string(),
      title: z.string(),
    }).partial(),
  }),
})

const apiDocsCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/api-documentation',
  }),
  schema: z.object({
    title: z.string(),
    seo: z.object({
      title: z.string(),
      description: z.string(),
    }).partial(),
    sortOrder: z.number(),
  }),
})

const dataDocsCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/data',
  }),
  schema: z.object({
    title: z.string(),
    seo: z.object({
      title: z.string(),
      description: z.string(),
    }).partial(),
    sortOrder: z.number(),
  }),
})

const resourcesCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/resources',
  }),
  schema: z.object({
    title: z.string(),
    seo: z.object({
      title: z.string(),
      description: z.string(),
    }).partial(),
  }),
})

const codeBooksCollection = defineCollection({
  loader: async () => await loadCodebooks({
    pattern: '**\/[^_]*.xml',
    base: './src/content/codebooks/',
  }),
  schema: z.object({
    id: z.string(),
    title: z.string().optional(),
    label: z.string(),
    shortName: z.string().optional(),
    longName: z.string().optional(),
    type: z.string().optional(),
    length: z.string().optional(),
    source: z.string().optional(),
    valueFormat: z.string().optional(),
    description: z.string().optional(),
    comment: z.string().optional(),
    values: z.object({
      code: z.string().optional(),
      text: z.string().optional(),
    }).array().optional(),
  }),
})

const csvVariablesCollection = defineCollection({
  loader: async () => await loadCsvResources({
    pattern: '**\/[^_]*.csv',
    base: './src/content/resources/variables/',
  }),
  schema: z.object({
    id: z.string(),
    sourceSystem: z.string().nullable(),
    fieldName: z.string(),
    sourceField: z.string().nullable(),
    altSourceField: z.string().nullable(),
    sourceDefinition: z.array(z.string()),
    versionAdded: z.number().nullable(),
    fieldLabel: z.string().nullable(),
  }),
})

const termsCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/terms',
  }),
  schema: z.object({
    title: z.string(),
    published_date: z.coerce.date(),
  }),
})

const fhirJsonCollection = defineCollection({
  loader: glob({
    pattern: '**/*.json',
    base: './src/content/fhir',
  }),
  schema: z.discriminatedUnion('resourceType', [structureDefinitionSchema, codeSystemSchema]),
})

const fhirMappingSchema = z.object({
  version: z.string(),
  resource: z.string(),
  element: z.string(),
  fhirPath: z.string().optional(),
  discriminator: z.array(z.string()).optional(),
  additional: z.array(z.string()).optional(),
  derived: z.string().optional(),
  note: z.string().optional(),
  example: z.string().optional(),
})

const dataDictionaryCollection = defineCollection({
  loader: dataDictionaryLoader({
    localPath: './data-dictionary.json',
  }),
  schema: z.object({
    id: z.number(),
    name: z.string(),
    description: z.string(),
    appliesTo: z.array(z.string()),
    suppliedIn: z.array(z.string()),
    bfdTableType: z.string(),
    bfdColumnName: z.string(),
    bfdDbType: z.string(),
    bfdDbSize: z.number().nullable(),
    bfdJavaFieldName: z.string(),
    ccwMapping: z.array(z.string()).optional(),
    cclfMapping: z.array(z.string()).optional(),
    fhirMapping: z.array(fhirMappingSchema).optional(),
  }),
})

const dataDictionaryV3Collection = defineCollection({
  loader: async () => await loadDataDictionaryCsv({
    pattern: '**/*.csv',
    base: './src/content/data-dictionary/',
  }),
  schema: z.object({
    id: z.string(),
    index: z.number(),
    fieldName: z.string(),
    description: z.string().nullable(),
    fhirResource: z.string().nullable(),
    coverageType: z.array(z.string()).nullable(),
    fhirPath: z.string().nullable(),
    example: z.string().nullable(),
    notes: z.string().nullable(),
    sourceView: z.string().nullable(),
    sourceColumn: z.string().nullable(),
    bfdDerived: z.string().nullable(),
    sources: z.array(z.string()).nullable(),
    referenceTable: z.string().nullable(),
    cclfMapping: z.array(z.string()).nullable(),
    ccwMapping: z.array(z.string()).nullable(),
    profiles: z.array(z.string()).nullable(),
  }),
})

export const collections = {
  pages: pageCollection,
  resources: resourcesCollection,
  apiDocs: apiDocsCollection,
  dataDocs: dataDocsCollection,
  codebooks: codeBooksCollection,
  csvVariables: csvVariablesCollection,
  terms: termsCollection,
  fhir: fhirJsonCollection,
  dataDictionary: dataDictionaryCollection,
  dataDictionaryV3: dataDictionaryV3Collection,
}
