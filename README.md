# CMS Blue Button API Static Site

## Project Description

A static site for the Blue Button API website: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/).

## About the Project

The [Blue Button API](https://bluebutton.cms.gov/) provides Medicare enrollee claims data to applications using the [OAuth2.0 authorization flow](https://datatracker.ietf.org/doc/html/rfc6749). We aim to provide a developer-friendly, standards-based API that enables people with Medicare to connect their claims data to the applications, services, and research programs they trust.

## Core Team

A list of core team members responsible for the code and documentation in this repository can be found in [COMMUNITY.md](COMMUNITY.md).

## Repository Structure

This structure documents the file structure necessary for static website, specifically.

```
├── .github/
├── .vscode/
├── ops/
├── public/
|   ├── img/
|   └── ...
├── scripts/
├── src/
│   ├── assets/
│   ├── components/
│   ├── content/
│   ├── layouts/
│   ├── pages/
│   ├── utils/
│   └── content.config.ts
├── .cspell.json
├── .gitignore
├── astro.config.mjs
├── eslint.config.mjs
├── package-lock.json
├── package.json
└── tsconfig.json
```

### Development and Software Delivery Lifecycle

The following guide is for members of the project team who have access to the repository as well as code contributors. The main difference between internal and external contributions is that external contributors will need to fork the project and will not be able to merge their own pull requests. For more information on contributing, see: [CONTRIBUTING.md](./CONTRIBUTING.md).

## Local Development

This project requires you to use [Node.js](https://nodejs.org/en). Once installed, you'll be able to run `npm` commands in your terminal.

### Setup

1. Run `npm install` to install required dependencies
   - If this is your first time setting up the repo, run `npx gulp copyAssets` (yes, **npx**). This will copy assets from USWDS's `node_modules` directory into the correct project directory.
2. Then, run `npm run dev` to start you local development server.
3. Once you're ready to test a build, run `npm run build`. If this process fails, there are errors you'll need to resolve before you'll be able to deploy.

### Additional Scripts

- Use `npm run sync` to update Astro's internal content processing and content types.
- Use `npm run lint` to check code quality against the defined `eslint` config.
- Use `npm run typecheck` to check for Typescript errors.
- Use `npm run lint:linkcheck` to verify validity of internal links the locally built site.
- Use `npm run spellcheck` to run `cspell` against the local content files.

## Directories

### `ops`

This is where our files related to deploying the site live.

### `scripts`

Any reusable scripts we use for development will use this directory. Typically, these scripts will be referenced in a defined `npm` script, inside `package.json`.

### `public`

This is where static, uncompiled files are stored. Things like the site's meta image, resources like PDF's and text documents, and any other files that are served "as-is".

### `public/img`

This is the default directory where USWDS's CSS expects icons to be. We only reference a few, so they're manually added into this location rather than running USWDS's `gulp` scripts.

### `src`

This is where the bulk of the project lives. Everything in here is bundled into the project files

### `src/assets`

Assets that are used by and bundled into the site. These files are optimized and compiled at "build time".

### `src/components`

Reusable pieces of code that are referenced regularly throughout the site. Can be `.astro` or `.tsx` components.

### `src/content`

Where our site's content lives. This can be (mostly) any data type: `markdown`, `json`, `csv`, etc. It's reference and loaded into our site as defined in `src/content.config.ts`.

### `src/layouts`

Similar to `src/components` in that it's a reusable piece of code. Except these components are used to "wrap around" rather than "injected into".

### `src/pages`

This is where Astro looks to create all the pages on the site. Pages can be `.astro` or `markdown` files. In our case, we're using `.astro` and pulling in `markdown` content manually. Each page is exposed as a route based on its file name.

- `src/pages/blog.astro` creates a `/blog` route.
- `src/pages/blog/[slug]` creates a dynamic `/blog/blog-slug` route.
- `src/pages/blog/[...slug]` creates a dynamic `/blog/a/b/c` route.

[More details on Astro routing](https://docs.astro.build/en/guides/routing/)

### `src/utils`

Various reusable functions that we use throught the site.

### `src/content.config.ts`

Where we define the site's content schemas. This let's us know the "shape" of our various content as we're working with it in our templates and components.

## File Types

This project uses various file and content types, most importantly `markdown`, `.astro`, and `.tsx`

### `markdown`

This site uses both `.md` and `.mdx` to render content. `.mdx` is a special type of `markdown` that is compiled with JavaScript. This means we can do some fancy things with it like use HTML directly, embed components, and reference frontmatter within a document.

[More about MDX](https://mdxjs.com/)

### `.astro`

Astro files are written with `JSX`, a special type of markup similar to HTML. You can use any type of valid HTML in these files. You can also write JavaScript functions and reference components.

The "frontmatter" is where the any variables are defined. These files are statically generated at build time so they cannot be used to run as client-side JavaScript (unless its written in a `<script>` tag).

## Codebook, Resources, FHIR Responses, and Data Dictionary

Like all other content, these resources live in `src/content` under a path that matches the pattern of the live URL path. For example, `https://bluebutton.cms.gov/resources/codesystem/eob-type/` content can be found at `src/content/resources/codesystem/eob-type`.

Any resource that is defined as `.mdx` or `.json` will automatically be processed just like any other content. However, other "data" content lives as `.csv` or `.xml` which require custom loaders. These loaders can be found in `utils/loaders`. These types of files undergo multiple steps of processing:

1. Data is ingested and initially parsed with a [`Zod`](https://zod.dev/) schema. This turns ambiguous data files into strongly typed data which ensures consistency and prevents unexpected bugs.
   1. We typically return the processed data with a more terse schema that is easier consume in our page templates.
2. These files are processed again for Astro's specific content schema generation. You can see this defined in `src/content.config.ts`.

## Deployment

For information about deploying to the static site, please referernce the following document in confluence: [HOW-TO Static Site Updates](https://confluence.cms.gov/x/84P0Fw).

## Branching Model

This project follows standard GitHub flow practices:

- Make changes in feature branches and merge to `master` frequently
- Pull-requests are reviewed before merging
- Tests should be written for changes introduced
- Each change should be deployable to production

Make changes on a new branch and create pull requests to merge them into the master branch when ready.

When creating a new branch, use the naming convention `[your-github-username]/[jira-ticket-number]-[description]`. For example, `mrengy/BB2-1511-layout-narrow-browser`.

You'll need to [use a Github Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) instead of a password in order to push changes.

## Contributing

Thank you for considering contributing to an Open Source project of the US Government! For more information about our contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

## Community

The Blue Button Web Server team is taking a community-first and open source approach to the product development of this tool. We believe government software should be made in the open and be built and licensed such that anyone can download the code, run it themselves without paying money to third parties or using proprietary software, and use it as they will.

We know that we can learn from a wide variety of communities, including those who will use or will be impacted by the tool, who are experts in technology, or who have experience with similar technologies deployed in other spaces. We are dedicated to creating forums for continuous conversation and feedback to help shape the design and development of the tool.

We also recognize capacity building as a key part of involving a diverse open source community. We are doing our best to use accessible language, provide technical and process documents, and offer support to community members with a wide variety of backgrounds and skillsets.

## Community Guidelines

Principles and guidelines for participating in our open source community are can be found in [COMMUNITY.md](COMMUNITY.md). Please read them before joining or starting a conversation in this repo or one of the channels listed below. All community members and participants are expected to adhere to the community guidelines and code of conduct when participating in community spaces including: code repositories, communication channels and venues, and events.

## Governance

For more information about our governance, see [GOVERNANCE.md](GOVERNANCE.md).

## Feedback

If you have ideas for how we can improve or add to our capacity building efforts and methods for welcoming people into our community, please let us know at **opensource@cms.hhs.gov**. If you would like to comment on the tool itself, please let us know by filing an **issue on our GitHub repository.**

## Policies

### Open Source Policy

We adhere to the [CMS Open Source Policy](https://github.com/CMSGov/cms-open-source-policy). If you have any questions, just [send us an email](mailto:opensource@cms.hhs.gov).

### Security and Responsible Disclosure Policy

_Submit a vulnerability:_ Vulnerability reports can be submitted through [Bugcrowd](https://bugcrowd.com/cms-vdp). Reports may be submitted anonymously. If you share contact information, we will acknowledge receipt of your report within 3 business days.

For more information about our Security, Vulnerability, and Responsible Disclosure Policies, see [SECURITY.md](SECURITY.md).

### Software Bill of Materials (SBOM)

A Software Bill of Materials (SBOM) is a formal record containing the details and supply chain relationships of various components used in building software.

In the spirit of [Executive Order 14028 - Improving the Nation's Cyber Security](https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028), a SBOM for this repository is provided here: https://github.com/CMSGov/bluebutton-web-server/network/dependencies.

For more information and resources about SBOMs, visit: https://www.cisa.gov/sbom.

## Public Domain

This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/) as indicated in [LICENSE](LICENSE).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request or issue, you are agreeing to comply with this waiver of copyright interest.
