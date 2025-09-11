type LinkItem = {
  href: string,
  label: string
}

export type PrimaryNavLinks = (LinkItem & {
  children?: never
} | {
  href?: never,
  label: string,
  children: LinkItem[]
})[]

export type IdentifierLinks = LinkItem[]