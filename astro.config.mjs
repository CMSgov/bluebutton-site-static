import { unified } from '@astrojs/markdown-remark'
import mdx from '@astrojs/mdx'
import preact from '@astrojs/preact'
import sitemap from '@astrojs/sitemap'
import expressiveCode from 'astro-expressive-code'
import typesafeRoutes from 'astro-typesafe-routes'
import { defineConfig, envField } from 'astro/config'

import fhirpathGrammar from './src/grammars/fhirpath.tmLanguage.json' with { type: 'json' }
import { SITE_METADATA } from './src/utils/constants'

// https://astro.build/config
export default defineConfig({
  site: SITE_METADATA.url,
  prefetch: {
    prefetchAll: true,
  },
  trailingSlash: 'ignore',

  env: {
    schema: {
      // The deployed environment, set in Jenkins script
      SITE_ENV: envField.enum({
        context: 'client',
        access: 'public',
        values: ['test', 'staging', 'prod'],
        default: 'prod',
      }),
    },
  },

  markdown: unified({
    remarkRehype: {
      footnoteLabelProperties: {
        class: 'usa-sr-only',
      },
    },
    shikiConfig: {
      theme: 'github-light',
    },
  }),

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          loadPaths: ['node_modules/@uswds/uswds/packages'],
          quietDeps: true,
        },
      },
      transformer: 'lightningcss',
    },
  },

  integrations: [
    expressiveCode({
      themes: ['github-light'],
      shiki: {
        langs: [fhirpathGrammar],
        langAlias: { fhirpath: 'Fhirpath' },
      },
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
    }),
    mdx(),
    sitemap(),
    typesafeRoutes(),
    preact(),
  ],

  redirects: {
    '/developers': '/api-documentation/',
    '/guide': '/production-access/',
    '/resources': '/data/resources/',
    // legacy redirects
    '/v2': '/api-documentation/',
    '/blog': '/data/resources/',
  },
})
