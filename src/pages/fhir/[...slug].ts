import type { APIRoute } from 'astro'

import { getCollection } from 'astro:content'

export async function getStaticPaths() {
  const posts = await getCollection('fhir')
  return posts.map(post => ({
    params: { slug: post.id },
    props: { post },
  }))
}

export const GET: APIRoute = async ({ props, url }) => {
  const data = props.post.data
  data.url = url

  return new Response(
    JSON.stringify(data, null, 2),
    {
      headers: {
        'Content-Type': 'application/json',
      },
    },
  )
}
