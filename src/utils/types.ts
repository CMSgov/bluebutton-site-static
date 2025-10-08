import type { RouteId, RouteOptions } from 'astro-typesafe-routes/path'
import type { HTMLAttributes } from 'astro/types'
import type { VariantProps } from 'cva'

import type { button } from './cva/button'

type LinkItem = ({
  href: string | URL
} | {
  href?: never
  to: RouteId
}) & {
  label: string
}

export type PrimaryNavLinks = (LinkItem & {
  children?: never
} | {
  href?: never
  to?: never
  label: string
  children: LinkItem[]
})[]

export type IdentifierLinks = LinkItem[]

type InternalLinkProps<T extends RouteId> = Omit<HTMLAttributes<'a'>, 'href'> & {
  path: RouteOptions<T>
  href?: false
}

type ExternalLinkProps = Omit<HTMLAttributes<'a'>, 'href'> & {
  href: string | URL
}

export type LinkProps<T extends RouteId> = (InternalLinkProps<T> | ExternalLinkProps)
  & VariantProps<typeof button> & {
    showIcon?: boolean
  }
