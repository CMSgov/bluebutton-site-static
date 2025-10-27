import type { RouteId, RouteOptions, Routes } from 'astro-typesafe-routes/path'

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

export type RoutesArray<T extends RouteId> = (RouteOptions<T> & Record<string, any>)[]

type RoutesToArray<T> = {
  [K in keyof T]: {
    to: K
  } & T[K]
}[keyof T]

export type RoutesUnion = RoutesToArray<Routes>
