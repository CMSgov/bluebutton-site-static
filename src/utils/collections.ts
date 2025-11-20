import { getCollection, z } from 'astro:content'

export async function getDataCollection() {
  return (await getCollection('dataDocs')).sort((a, b) => a.data.sortOrder - b.data.sortOrder)
}
export async function getApiCollection() {
  return (await getCollection('apiDocs')).sort((a, b) => a.data.sortOrder - b.data.sortOrder)
}

export async function getTermsCollection() {
  return (await getCollection('terms')).sort((a, b) => {
    // Newest to oldest
    return b.id.localeCompare(a.id)
  })
}

export const structureDefinitionSchema = z.object({
  resourceType: z.literal('StructureDefinition'),
  id: z.string(),
  url: z.string().url(),
  name: z.string(),
  title: z.string(),
  status: z.string(),
  description: z.string(),
  fhirVersion: z.string(),
  kind: z.string(),
  abstract: z.boolean(),
  context: z.array(z.object({
    type: z.string(),
    expression: z.string(),
  })),
  type: z.string(),
  baseDefinition: z.string(),
  derivation: z.string(),
  differential: z.object({
    element: z.array(z.object({
      id: z.string(),
      path: z.string(),
      short: z.string().optional(),
      definition: z.string().optional(),
      max: z.string().optional(),
      fixedUri: z.string().url().optional(),
      type: z.array(z.object({
        code: z.string(),
      })).optional(),
      patternUri: z.string().url().optional(),
    })),
  }),
})

export const codeSystemSchema = z.object({
  resourceType: z.literal('CodeSystem'),
  status: z.string(),
  content: z.string(),
  name: z.string(),
  id: z.string(),
  title: z.string(),
  description: z.string(),
  url: z.string().url(),
  concept: z.array(z.object({
    code: z.string(),
    display: z.string(),
  })),
  count: z.number(),
})
