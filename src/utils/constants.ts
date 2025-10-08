import type { IdentifierLinks, PrimaryNavLinks } from './types'

export const PRIMARY_NAV_LINKS: PrimaryNavLinks = [
  {
    label: 'About',
    children: [
      {
        label: 'About BCDA',
        to: '/about',
      },
      {
        label: 'Announcements',
        to: '/announcements',
      },
    ],
  },
  {
    label: 'API Documentation',
    children: [
      {
        label: 'Get Started',
        to: '/api-documentation',
      },
      {
        label: 'How to Get a Bearer Token',
        to: '/api-documentation/get-a-bearer-token',
      },
      {
        label: 'How to Access Claims Data',
        to: '/api-documentation/access-claims-data',
      },
      {
        label: 'How to Filter Claims Data',
        to: '/api-documentation/filter-claims-data',
      },
    ],
  },
  {
    label: 'BCDA Data',
    children: [
      {
        label: 'BCDA Data',
        to: '/bcda-data',
      },
      {
        label: 'Guide to Partially Adjudicated Claims Data',
        to: '/bcda-data/partially-adjudicated-claims-data',
      },
      {
        label: 'Comparison of BCDA and CCLF',
        to: '/bcda-data/comparison-bcda-cclf-files',
      },
      {
        label: 'Difference Between V1 and V2',
        to: '/bcda-data/difference-between-v1-v2',
      },
    ],
  },
  {
    label: 'Production Access',
    to: '/production-access',
  },
  {
    label: 'Support',
    to: '/support',
  },
]

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
    to: '/resources/terms',
    label: 'Terms of Service',
  },
]
