import type { APIContext, InferGetStaticPropsType } from 'astro'

import { getCollection } from 'astro:content'

export async function getStaticPaths() {
  const posts = await getCollection('fhir')
  return posts.map(post => ({
    // This preserves the correct casing for these files. Forcing them to lowercase, alhough preferred, could cause 404 errors on Cloudfront
    params: { slug: `/${post.data.resourceType}/${post.data.id}` },
    props: { post },
  }))
}

type Props = InferGetStaticPropsType<typeof getStaticPaths>

export async function GET({ props }: APIContext<Props>) {
  return new Response(
    JSON.stringify(props.post.data, null, 2),
    {
      headers: {
        'Content-Type': 'application/json',
      },
    },
  )
}
