
declare module "astro-typesafe-routes/link" {
  import type { HTMLAttributes } from "astro/types";
  import type { RouteOptions, RouteId } from "astro-typesafe-routes/path";

  type LinkBaseProps = Omit<HTMLAttributes<"a">, "href">;

  export type LinkProps<T extends RouteId> = LinkBaseProps & RouteOptions<T>;
  export default function Link<T extends RouteId>(props: LinkProps<T>): any;
}

declare module "astro-typesafe-routes/link/react" {
  import type { ComponentProps } from "react";
  import type { RouteOptions, RouteId } from "astro-typesafe-routes/path";

  type LinkBaseProps = Omit<ComponentProps<"a">, "href">;

  export type LinkProps<T extends RouteId> = LinkBaseProps & RouteOptions<T>;
  export default function Link<T extends RouteId>(props: LinkProps<T>): any;
}

declare module "astro-typesafe-routes/create-route" {
  import type { AstroGlobal, GetStaticPaths } from "astro";
  import type { RouteId, Routes, RouteOptions } from "astro-typesafe-routes/path";
  import type { StandardSchemaV1 } from "astro-typesafe-routes/standard-schema";
  import type { RouteId, ParamsRecord } from "astro-typesafe-routes/path";

  export type CreateRouteParams<T extends RouteId, S extends StandardSchemaV1> = {
    routeId: T;
    searchSchema?: S;
  };

  type Props = Record<string, unknown>;

  type GetStaticPathsItem<T extends RouteId, P extends Props = Props> = {
    params: ParamsRecord<T>;
    props?: P;
  };

  type AstroAny = AstroGlobal<any, any, any>;

  function createRoute<T extends RouteId, S extends StandardSchemaV1>(opts: CreateRouteParams<T, S>): {
    searchSchema: S;
    getParams: (astro: AstroAny) => Routes[T]["params"] extends null ? never : { [key in Routes[T]["params"][number]]: string };
    getSearch: (astro: AstroAny) => StandardSchemaV1.InferOutput<S>;
    redirect: <L extends RouteId>(astro: AstroAny, args: RouteOptions<L>) => Response;
    rewrite: <L extends RouteId>(astro: AstroAny, args: RouteOptions<L>) => Promise<Response>;
    createGetStaticPaths: <P>(
      fn: () => Promise<GetStaticPathsItem<T, P>[]> | GetStaticPathsItem<T, P>[]
    ) => GetStaticPaths;
  }
}

declare module "astro-typesafe-routes/path" {
  import type { StandardSchemaV1 } from "astro-typesafe-routes/standard-schema";

  export type Routes = {"/about": { params: null; search: null },
"/api": { params: null; search: null },
"/api-docs/[...slug]": { params: ["slug"]; search: null },
"/api-documentation": { params: null; search: null },
"/data/[...slug]": { params: ["slug"]; search: null },
"/production-access": { params: null; search: null },
"/resources": { params: null; search: null },
"/resources/[...slug]": { params: ["slug"]; search: null },
"/support": { params: null; search: null },
"/use-cases": { params: null; search: null },
"/": { params: null; search: null }};

  export type RouteId = keyof Routes;

  export type ParamsRecord<T extends RouteId> =
    Routes[T]["params"] extends Array<string>
      ? { [key in Routes[T]["params"][number]]: string | number }
      : null;

  type AreAllFieldsOptional<T> = {
    [K in keyof T]-?: undefined extends T[K] ? true : false;
  }[keyof T] extends true
    ? true
    : false;

  export type RouteOptions<T extends RouteId> = {
    to: T;
    hash?: string | undefined;
    trailingSlash?: boolean | undefined;
    searchParams?: ConstructorParameters<typeof URLSearchParams>[0] | undefined;
  } & (Routes[T]["search"] extends null
    ? { search?: undefined }
    : AreAllFieldsOptional<
          StandardSchemaV1.InferInput<Routes[T]["search"]>
        > extends true
      ? {
          search?: StandardSchemaV1.InferInput<Routes[T]["search"]> | undefined;
        }
      : {
          search: StandardSchemaV1.InferInput<Routes[T]["search"]>;
        }) &
    (Routes[T]["params"] extends null
      ? { params?: undefined }
      : { params: ParamsRecord<T> });

  export function $path<T extends RouteId>(args: RouteOptions<T>): string;
}
