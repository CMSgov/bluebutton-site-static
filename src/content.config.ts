import { loadCodebooks } from '#utils/load-codebooks'
import { csvLoader } from '@ascorbic/csv-loader'
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
  loader: csvLoader({
    fileName: './src/content/resources/variables/rda_api_data_dictionary.csv',
    idField: 'fieldName',
  }),
  schema: z.object({
    'sourceSystem': z.string().nullable().optional(),
    'fieldName': z.string().optional(),
    'sourceCopybookFieldLabel': z.string().optional(),
    'copybookDataDictionaryName(ifDifferent)': z.string().optional().transform(val => val === 'n/a' ? '' : val),
    // altSourceField: z.string().optional(),
    'sourceSystemDefinition': z.string().nullable().optional(),
    'versionAdded': z.coerce.string().transform(val => Number.isNaN(val) ? Number.NaN : val),
    // field_label: z.string().optional(),
  }),
})

export const collections = {
  pages: pageCollection,
  resources: resourcesCollection,
  apiDocs: apiDocsCollection,
  dataDocs: dataDocsCollection,
  codebooks: codeBooksCollection,
  csvVariables: csvVariablesCollection,
}
