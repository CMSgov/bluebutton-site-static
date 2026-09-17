import { z } from 'astro/zod'
import { getCollection } from 'astro:content'

export async function getDataCollection() {
  return (await getCollection('static', ({ id }) => id.startsWith('data/'))).sort((a, b) => {
    return (a.data.sortOrder || 0) - (b.data.sortOrder || 0)
  })
}
export async function getApiCollection() {
  return (await getCollection('static', ({ id }) => id.startsWith('api/'))).sort((a, b) => {
    return (a.data.sortOrder || 0) - (b.data.sortOrder || 0)
  })
}

export async function getQuickstartCollection() {
  return (await getCollection('static', ({ id }) => id.startsWith('quickstart/'))).sort((a, b) => {
    return (a.data.sortOrder || 0) - (b.data.sortOrder || 0)
  })
}

export async function getGuidesCollection() {
  return (await getCollection('static', ({ id }) => id.startsWith('guides/'))).sort((a, b) => {
    return (a.data.sortOrder || 0) - (b.data.sortOrder || 0)
  })
}
export async function getProductionCollection() {
  return (await getCollection('static', ({ id }) => id.startsWith('production-access/'))).sort((a, b) => {
    return (a.data.sortOrder || 0) - (b.data.sortOrder || 0)
  })
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
  url: z.url(),
  name: z.string(),
  title: z.string().optional(),
  status: z.string(),
  description: z.string().optional(),
  fhirVersion: z.string(),
  kind: z.string(),
  abstract: z.boolean(),
  context: z.array(z.object({
    type: z.string(),
    expression: z.string(),
  })).optional(),
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
      fixedUri: z.url().optional(),
      type: z.array(z.object({
        code: z.string(),
      })).optional(),
      patternUri: z.url().optional(),
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
  url: z.url(),
  concept: z.array(z.object({
    code: z.string(),
    display: z.string().optional(),
  })),
  count: z.number(),
})
