type SvgImport = typeof import("*.svg");
export type SvgComponent = SvgImport extends {
  default: infer Component;
}
  ? Component
  : never;