import type { CheckBase } from './check'
import type { HtmlPage } from './page'

import { formatCount } from '../../output.mjs'

export interface LinkIssue {
  type: IssueType
  linkHref: string
  autofixHref?: string
  annotationText?: string
  page: HtmlPage
  check: CheckBase
  sourceFileAnnotations: SourceFileAnnotation[]
}

/**
 * Copied from https://github.com/actions/toolkit/blob/main/packages/core/src/core.ts#L40
 * Optional properties that can be sent with annotation commands (notice, error, and warning)
 * See: https://docs.github.com/en/rest/reference/checks#create-a-check-run for more information about annotations.
 */
export interface AnnotationProperties {
  /**
   * A title for the annotation.
   */
  title?: string

  /**
   * The path of the file for which the annotation should be created.
   */
  file?: string

  /**
   * The start line for the annotation.
   */
  startLine?: number

  /**
   * The end line for the annotation. Defaults to `startLine` when `startLine` is provided.
   */
  endLine?: number

  /**
   * The start column for the annotation. Cannot be sent when `startLine` and `endLine` are different values.
   */
  startColumn?: number

  /**
   * The end column for the annotation. Cannot be sent when `startLine` and `endLine` are different values.
   * Defaults to `startColumn` when `startColumn` is provided.
   */
  endColumn?: number
}

export interface SourceFileAnnotation {
  message: string
  location: AnnotationProperties
  autofixed?: boolean
}

export class IssueType {
  readonly title: string
  readonly prefix: string
  readonly sortOrder: number

  constructor({ title, prefix, sortOrder }: { title: string, prefix: string, sortOrder: number }) {
    this.title = title
    this.prefix = prefix
    this.sortOrder = sortOrder
  }

  /**
   * Formats the issue `title` template based on `count`.
   *
   * See {@link formatCount} for full formatting logic.
   */
  formatTitle(count?: number) {
    return formatCount(count, this.title)
  }
}
