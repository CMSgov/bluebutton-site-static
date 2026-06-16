import { trailingSlash } from 'astro:config/server'

// Normalize an internal path's trailing slash to match the global Astro 'trailingSlash' setting
export function withTrailingSlash(path: string): string {
  if (trailingSlash === 'always') {
    return path.endsWith('/')
      ? path.replace(/\/+$/g, '/') // Ensure only one trailing slash
      : `${path}/`
  }
  if (trailingSlash === 'never') {
    return path.replace(/\/+$/g, '') || '/'
  }
  return path
}
