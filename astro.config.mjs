import mdx from '@astrojs/mdx'
import sitemap from '@astrojs/sitemap'
import expressiveCode from 'astro-expressive-code'
import typesafeRoutes from 'astro-typesafe-routes'
import { defineConfig } from 'astro/config'

import { SITE_METADATA } from './src/utils/constants'

// https://astro.build/config
export default defineConfig({
  site: SITE_METADATA.url,
  prefetch: {
    prefetchAll: true,
  },
  trailingSlash: 'always',

  markdown: {
    remarkRehype: {
      footnoteLabelProperties: {
        class: 'usa-sr-only',
      },
    },
    shikiConfig: {
      theme: 'github-light',
    },
  },

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          loadPaths: ['node_modules/@uswds/uswds/packages'],
          quietDeps: true,
        },
      },
    },
  },

  integrations: [expressiveCode({
    themes: ['github-light'],
    styleOverrides: {
      frames: {
        editorBackground: '#f7f9fa',
        terminalBackground: '#f7f9fa',
        frameBoxShadowCssValue: '0',
      },
      codeBackground: '#f7f9fa',
      uiFontSize: '0.85rem',
      codeFontSize: '1rem',
    },

  }), mdx(), sitemap(), typesafeRoutes()],

  redirects: {
    '/developers': '/api-documentation/',
    '/guide': '/production-access/',
    '/resources': '/data/resources/',
    // legacy redirects
    '/v2': '/api-documentation/',
    '/blog': '/data/resources/',
  },
})
