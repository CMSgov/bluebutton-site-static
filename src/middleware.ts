import type { MiddlewareHandler } from 'astro';

export const onRequest: MiddlewareHandler = async (_, next) => {
  const response = await next();
  response.headers.set('X-Content-Type-Options', 'nosniff');
  return response;
};