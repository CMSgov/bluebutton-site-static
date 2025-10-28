import { getCollection } from 'astro:content'

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
