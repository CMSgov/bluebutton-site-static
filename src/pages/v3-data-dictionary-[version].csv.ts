import Papa from 'papaparse'

import json from '../content/data-dictionary/data-dictionary.json'

export async function getStaticPaths() {
  return [
    { params: { version: json.version } },
  ]
}

export function GET() {
  return new Response(
    Papa.unparse(json.fields.map(field =>
      Object.fromEntries(Object.entries(field).map(([key, value]) => [
        key,
        // Convert objects and arrays to JSON strings to match BFD's CSV
        value !== null && typeof value === 'object' ? JSON.stringify(value) : value,
      ])),
    )),
  )
}
