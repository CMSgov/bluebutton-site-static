import type { RouteId, RouteOptions } from 'astro-typesafe-routes/path'

export type HrefOrTo<T extends RouteId> = {
  // External links
  href: string | URL
} | (RouteOptions<T> & {
  // Internal links with full route options
  href?: never
})

export type IdentifierLinks = ({
  label: string
} & HrefOrTo<RouteId>)[]
