# Astro Proof of Concept

## Astro Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## Compatitibility with USWDS 

Removed `"type": "module",` from `package.json`. Modules are not compatible with the gulpfile, which is necessary to support USWDS.

Moved USWDS css mapping to /public and added paths in gulpfile 