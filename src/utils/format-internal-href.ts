import { trailingSlash } from 'astro:config/server'

import { SITE_METADATA } from './constants'

export function formatInternalHref(href: string) {
  // Strip our own origin so internal absolute URLs become root-relative.
  const relative = href.startsWith(SITE_METADATA.url)
    ? href.slice(SITE_METADATA.url.length) || '/'
    : href

  // Only normalize root-relative paths; leave external URLs and bare #/? references alone.
  if (!relative.startsWith('/')) {
    return relative
  }

  const url = new URL(relative, SITE_METADATA.url)
  if (trailingSlash === 'always') {
    url.pathname = url.pathname.replace(/\/*$/, '/')
  }
  else if (trailingSlash === 'never') {
    url.pathname = url.pathname.replace(/\/+$/, '') || '/'
  }
  return `${url.pathname}${url.search}${url.hash}`
}
