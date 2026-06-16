import type { RouteId, RouteOptions } from 'astro-typesafe-routes/path'

// External links use 'href'; internal links use the full route options and forbid 'href'
export type HrefOrTo<T extends RouteId> = { href: string | URL } | (T extends RouteId ? RouteOptions<T> & { href?: never } : never)

export type IdentifierLinks = ({
  label: string
} & HrefOrTo<RouteId>)[]

export type RoutesArray<T extends RouteId> = (RouteOptions<T> & Record<string, any>)[]
