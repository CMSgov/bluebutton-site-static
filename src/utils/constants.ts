import type { Link } from 'astro-seo'

import type { IdentifierLinks } from './types'

export const SITE_METADATA: {
  title: string
  description: string
  url: string
  image: string
  favicon: Partial<Link>[]
  googleSiteVerification: string
} = {
  title: 'CMS Blue Button',
  description: 'The CMS Blue Button API enables beneficiaries to connect their Medicare claims data to the applications, services, and research programs they trust.',
  url: 'https://bluebutton.cms.gov',
  image: '/meta/og.jpg',
  favicon: [
    {
      rel: 'icon',
      type: 'image/svg+xml',
      href: '/meta/favicon.ico',
    },
    {
      rel: 'icon',
      type: 'image/png',
      href: '/meta/favicon-96x96.png',
      sizes: '96x96',
    },
    {
      rel: 'shortcut icon',
      href: '/meta/favicon.ico',
    },
    {
      rel: 'apple-touch-icon',
      sizes: '180x180',
      href: '/meta/apple-touch-icon.png',
    },
  ],
  googleSiteVerification: '4BKCcWU84KzkBcBHkIMbVUWpM5_UWoee6k8YZtMc8SM',
}

export const GOOGLE_GROUP_LINK = 'https://groups.google.com/g/developer-group-for-cms-blue-button-api'

export const IDENTIFIER_LINKS: IdentifierLinks = [
  {
    href: 'https://www.cms.gov/about-cms',
    label: 'About CMS',
  },
  {
    href: 'https://www.medicare.gov/',
    label: 'Medicare.gov',
  },
  {
    href: 'https://www.medicaid.gov/',
    label: 'Medicaid.gov',
  },
  {
    href: 'https://www.healthcare.gov/',
    label: 'healthcare.gov',
  },
  {
    href: 'https://developer.cms.gov',
    label: 'Developer.cms.gov',
  },
  {
    href: 'https://design.cms.gov/',
    label: 'CMS Design System',
  },
  {
    href: 'https://designsystem.digital.gov/',
    label: 'U.S. Web Design System',
  },
  {
    href: 'https://www.cms.gov/about-cms/web-policies-important-links/foia',
    label: 'Freedom of Information Act',
  },
  {
    href: 'https://oig.hhs.gov/',
    label: 'Inspector General',
  },
  {
    href: 'https://www.cms.gov/about-cms/web-policies-important-links/no-fear-act',
    label: 'No Fear Act',
  },
  {
    href: 'https://www.medicare.gov/about-us/plain-writing',
    label: 'Plain Writing',
  },
  {
    href: 'https://www.cms.gov/About-CMS/Agency-Information/Aboutwebsite/Privacy-Policy',
    label: 'CMS Privacy Policy',
  },
  {
    href: 'https://www.cms.gov/vulnerability-disclosure-policy',
    label: 'CMS/HHS Vulnerability Disclosure Policy',
  },
  {
    href: 'https://www.cms.gov/about-cms/web-policies-important-links/accessibility-nondiscrimination-disabilities-notice',
    label: 'Accessibility Statement',
  },
  {
    href: 'https://www.cms.gov/about-cms/performance-budget/current',
    label: 'Performance Reports',
  },
  {
    to: '/terms',
    // params: null,
    label: 'Terms of Service',
  },
]
