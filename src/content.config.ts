import { defineCollection, z } from 'astro:content';
import { glob as tinyglobby } from "tinyglobby";
import { glob, file } from 'astro/loaders';
import { XMLParser } from 'fast-xml-parser';
import { readFileSync } from 'node:fs';
import path from 'node:path';

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

const codeBookSchema = z.array(z.object({
  "@_id": z.string(),
  "@_label": z.string(),
  "@_shortName": z.string().optional(),
  "@_longName": z.string(),
  "@_type": z.string().optional(),
  "@_length": z.string(),
  "@_source": z.string().optional(),
  "@_valueFormat": z.string().optional(),
  description: z.object({
    p: z.preprocess(v => Array.isArray(v) ? v : [v], z.array(z.string()))
  }),
  comment: z.object({
    p: z.preprocess(v => Array.isArray(v) ? v : [v], z.array(z.string()))
  }).optional(),
  valueGroups: z.object({
    valueGroup: z.union([
      z.object({
        description: z.object({
          p: z.preprocess(v => Array.isArray(v) ? v : [v], z.array(z.string()))
        }).optional(),
        // value: z.union([
        //   z.array(z.object({
        //     "#text": z.coerce.string(),
        //     "@_code": z.string()
        //   })),
        // z.object({
        //   "#text": z.coerce.string(),
        //   "@_code": z.string()
        // })
        // ])
        value: z.preprocess(v => Array.isArray(v) ? v : [v], z.array(z.object({
          "#text": z.coerce.string(),
          "@_code": z.string()
        })))
      }),
      z.array(z.object({
        value: z.preprocess(v => Array.isArray(v) ? v : [v], z.array(z.object({
          "#text": z.coerce.string(),
          "@_code": z.string()
        })))
        // value: z.union([
        //   z.array(z.object({
        //     "#text": z.coerce.string(),
        //     "@_code": z.string()
        //   })),
        //   z.object({
        //     "#text": z.coerce.string(),
        //     "@_code": z.string()
        //   })
        // ])
      }))
    ])
  }).optional()
}))

const codeBooksCollection = defineCollection({
  loader: async () => {
    const baseDir = "./src/content/codebooks/"
    const codebookFiles = await tinyglobby("**\/[^_]*.xml", {
      cwd: baseDir,
      expandDirectories: false
    });

    // let codebooks: {
    //   id: string,
    // }[] = []

    return codebookFiles.flatMap((cf) => {
      const filePath = path.join(baseDir, cf)
      const fileContent = readFileSync(filePath, { encoding: "utf-8" });

      const parser = new XMLParser({
        ignoreAttributes: false
      })
      const data = parser.parse(fileContent)
      const parsed = codeBookSchema.safeParse(data.codebook.variable)

      if (!parsed.success) {
        console.error(parsed.error.errors)
        throw new Error("Failed to parse: " + filePath);

      } else {
        return parsed.data?.map(val => ({
          id: val['@_id'].toLowerCase(),
          title: val['@_id'],
          label: val['@_label'],
          shortName: val['@_shortName'] || "",
          longName: val['@_longName'] || "",
          type: val['@_type'] || "",
          length: val['@_length'] || "",
          source: val['@_source'] || "",
          valueFormat: val['@_valueFormat'] || "",
          description: Array.isArray(val.description.p)
            ? val.description.p.join(' ')
            : val.description.p,
          comment: Array.isArray(val.comment?.p)
            ? val.comment.p.join(' ')
            : val.comment?.p,
          values: Array.isArray(val.valueGroups?.valueGroup)
            ? val.valueGroups.valueGroup.flatMap(vg => Array.isArray(vg.value)
              ? vg.value.map(v => ({
                code: v['@_code'] || "",
                text: v['#text'] || ""
              }))
              : [{
                code: vg.value['@_code'] || "",
                text: vg.value['#text'] || ""
              }]
            )
            : Array.isArray(val.valueGroups?.valueGroup.value)
              ? val.valueGroups?.valueGroup.value.map(v => ({
                code: v['@_code'] || "",
                text: v['#text'] || ""
              })) : [{
                code: val.valueGroups?.valueGroup.value['@_code'] || "",
                text: val.valueGroups?.valueGroup.value['#text'] || ""
              }]
        }))
      }

    })
  },
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