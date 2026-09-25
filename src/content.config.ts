import { file, glob } from 'astro/loaders'
import { z } from 'astro/zod'
import { defineCollection } from 'astro:content'

import { codeSystemSchema, structureDefinitionSchema } from '#utils/collections'
import { loadCodebooks } from '#utils/loaders/load-codebooks'
import { loadCsvResources } from '#utils/loaders/load-csv-resources'
import { fieldSchema, parseDataDictionary } from '#utils/loaders/parse-data-dictionary'

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

const dataDictionaryCollection = defineCollection({
  loader: file('./src/content/data-dictionary/data-dictionary.json', {
    parser: parseDataDictionary,
  }),
  schema: fieldSchema,
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
}
