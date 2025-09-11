// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

import sitemap from '@astrojs/sitemap';

import typesafeRoutes from 'astro-typesafe-routes';

// https://astro.build/config
export default defineConfig({
  site: 'https://bluebutton.cms.gov',

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          loadPaths: ["node_modules/@uswds/uswds/packages"],
          quietDeps: true,
        }
      }
    },
  },

  integrations: [mdx(), sitemap(), typesafeRoutes()],
})