import type { RouteId, RouteOptions } from 'astro-typesafe-routes/path'
import type { HTMLAttributes } from 'astro/types'
import type { VariantProps } from 'cva'

import type { button } from './cva/button'

type HrefOrTo<T extends RouteId> = {
  // External links
  href: string | URL
} | (RouteOptions<T> & {
  // Internal links with full route options
  href?: never
})

type LinkItem = {
  label: string
} & HrefOrTo<RouteId>

export type IdentifierLinks = LinkItem[]

type BaseLinkProps = Omit<HTMLAttributes<'a'>, 'href'> & VariantProps<typeof button> & {
  showIcon?: boolean
}

export type LinkProps<T extends RouteId> = BaseLinkProps & HrefOrTo<T>
