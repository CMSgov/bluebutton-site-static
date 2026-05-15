import type { Loader } from 'astro/loaders'

import { existsSync, readFileSync, writeFileSync } from 'node:fs'

export function dataDictionaryLoader({ localPath }: { localPath: string }): Loader {
  const url = 'https://raw.githubusercontent.com/jhutchison-nava/data-dictionary-test/main/data-dictionary-V2.json'

  return {
    name: 'data-dictionary',
    load: async ({ store, parseData, generateDigest, logger }) => {
      let raw: unknown

      if (existsSync(localPath)) {
        raw = JSON.parse(readFileSync(localPath, 'utf-8'))
      }
      else {
        logger.info(`Fetching ${url}`)
        const res = await fetch(url)
        if (!res.ok)
          throw new Error(`Failed to fetch ${url}: ${res.status}`)
        raw = await res.json()
        writeFileSync(localPath, JSON.stringify(raw, null, 2))
      }

      if (!Array.isArray(raw))
        throw new Error('Data dictionary source is not an array')

      store.clear()
      for (const record of raw as Array<Record<string, unknown>>) {
        const slug = typeof record.bfdColumnName === 'string' && record.bfdColumnName.length > 0
          ? record.bfdColumnName.replace(/_/g, '-')
          : String(record.id)
        const data = await parseData({ id: slug, data: record })
        store.set({ id: slug, data, digest: generateDigest(data) })
      }
    },
  }
}
