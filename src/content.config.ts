// 1. Import utilities from `astro:content`
import { defineCollection, z } from 'astro:content';

// 2. Import loader(s)
import { glob, file } from 'astro/loaders';

// 3. Define your collection(s)
const pageCollection = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.(md|mdx)",
    base: "./src/content/pages"
  }),
  schema: z.object({
    title: z.string(),
    description: z.string()
  })
});

const resourcesCollection = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.(md|mdx)",
    base: "./src/content/resources"
  }),
  schema: z.object({
    title: z.string(),
    // description: z.string()
  })
});

const apiDocsCollection = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.(md|mdx)",
    base: "./src/content/api-docs"
  }),
  schema: z.object({
    title: z.string(),
    // description: z.string(),
    sortOrder: z.number(),
  })
});

const dataDocsCollection = defineCollection({
  loader: glob({
    pattern: "**\/[^_]*.(md|mdx)",
    base: "./src/content/data"
  }),
  schema: z.object({
    title: z.string(),
    // description: z.string(),
    sortOrder: z.number(),
  })
});

// 4. Export a single `collections` object to register your collection(s)
export const collections = {
  pages: pageCollection,
  resources: resourcesCollection,
  apiDocs: apiDocsCollection,
  dataDocs: dataDocsCollection,
};