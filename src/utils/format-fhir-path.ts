import prettier from 'prettier'
import fhirpathPlugin from 'prettier-plugin-fhirpath'

export async function formatFhirPath(raw: string): Promise<string> {
  try {
    const out = await prettier.format(raw, {
      parser: 'fhirpath',
      plugins: [fhirpathPlugin],
    })
    return out.trimEnd()
  }
  catch {
    return raw
  }
}
