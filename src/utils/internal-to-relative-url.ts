import { SITE_METADATA } from './constants'

export function internalToRelativeUrl(url: string) {
  return url.startsWith(SITE_METADATA.url)
    ? url.replace(SITE_METADATA.url, '')
    : url
}
