import { defineCollection, z } from 'astro:content';
import { glob as tinyglobby } from "tinyglobby";
import { glob, file } from 'astro/loaders';
import { XMLParser } from 'fast-xml-parser';
import { readFileSync } from 'node:fs';
import path from 'node:path';
import { loadCodebooks } from 'utils/load-codebooks';

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



const codeBooksCollection = defineCollection({
  loader: async () => await loadCodebooks({
    pattern: "**\/[^_]*.xml",
    base: "./src/content/codebooks/"
  }),
  schema: z.object({
    id: z.string(),
    title: z.string(),
    label: z.string(),
    shortName: z.string(),
    longName: z.string(),
    type: z.string(),
    length: z.string(),
    source: z.string(),
    valueFormat: z.string(),
    description: z.string(),
    comment: z.string().optional(),
    values: z.array(z.object({
      code: z.string(),
      text: z.string()
    })).optional()
  })
})

// 4. Export a single `collections` object to register your collection(s)
export const collections = {
  pages: pageCollection,
  resources: resourcesCollection,
  apiDocs: apiDocsCollection,
  dataDocs: dataDocsCollection,
  codeBooks: codeBooksCollection
};