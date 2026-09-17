import { glob } from 'astro/loaders'
import { z } from 'astro/zod'
import { defineCollection } from 'astro:content'

import { codeSystemSchema, structureDefinitionSchema } from '#utils/collections'
import { loadCodebooks } from '#utils/loaders/load-codebooks'
import { loadCsvDataDictionary } from '#utils/loaders/load-csv-data-dictionary'
import { loadCsvResources } from '#utils/loaders/load-csv-resources'

const seoSchema = z.object({
  title: z.string(),
  description: z.string(),
}).partial().optional()

const staticCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/static',
  }),
  schema: z.object({
    title: z.string(),
    seo: seoSchema,
    sortOrder: z.coerce.number().optional(),
  }),
})

const termsCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/terms',
  }),
  schema: z.object({
    title: z.string(),
    seo: seoSchema,
    publishedDate: z.coerce.date(),
  }),
})

const resourcesCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/resources',
  }),
  schema: z.object({
    title: z.string(),
    seo: seoSchema,
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
    valuegroups: z.object({
      description: z.string().optional(),
      values: z.object({
        code: z.string().optional(),
        text: z.string().optional(),
      }).array().optional(),
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

const fhirJsonCollection = defineCollection({
  loader: glob({
    pattern: '**/*.json',
    base: './src/content/fhir',
  }),
  schema: z.discriminatedUnion('resourceType', [structureDefinitionSchema, codeSystemSchema]),
})

const dataDictionaryCollection = defineCollection({
  loader: async () => await loadCsvDataDictionary({
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
    referenceTable: z.url().nullable(),
    cclfMapping: z.array(z.string()).nullable(),
    ccwMapping: z.array(z.string()).nullable(),
    profiles: z.array(z.string()).nullable(),
  }),
})

export const collections = {
  static: staticCollection,
  resources: resourcesCollection,
  codebooks: codeBooksCollection,
  csvVariables: csvVariablesCollection,
  fhir: fhirJsonCollection,
  terms: termsCollection,
  dataDictionary: dataDictionaryCollection,
}
