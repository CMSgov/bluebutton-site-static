import mdx from '@astrojs/mdx'
import sitemap from '@astrojs/sitemap'
import typesafeRoutes from 'astro-typesafe-routes'
// @ts-check
import { defineConfig } from 'astro/config'

// https://astro.build/config
export default defineConfig({
  site: 'https://bluebutton.cms.gov',
  prefetch: {
    prefetchAll: true,
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

  integrations: [mdx(), sitemap(), typesafeRoutes()],
})
