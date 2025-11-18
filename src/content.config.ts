import { loadCodebooks } from '#utils/load-codebooks'
import { loadCsvResources } from '#utils/load-csv-resources'
import { glob } from 'astro/loaders'
import { defineCollection, z } from 'astro:content'

const pageCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/pages',
  }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
  }),
})

const apiDocsCollection = defineCollection({
  loader: glob({
    pattern: '**\/[^_]*.(md|mdx)',
    base: './src/content/api-documentation',
  }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
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
    description: z.string(),
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
    }),
  }),
})

const codeBooksCollection = defineCollection({
  loader: async () => await loadCodebooks({
    pattern: '**\/[^_]*.xml',
    base: './src/content/codebooks/',
  }),
  schema: z.object({
    id: z.string(),
    title: z.string(),
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
  schema: z.any(),
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
}
