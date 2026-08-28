import SearchIcon from '@uswds/uswds/img/usa-icons/search.svg?raw'
import { useRef, useState } from 'preact/hooks'

import Pagination from '#components/pagination'
import { useDebouncedCallback } from '#utils/use-debounced-callback'

export interface DefaultField {
  url: string
  fieldName: string
  sourceColumn: string | null
  description: string | null
}

interface PagefindResult {
  data: () => Promise<{ url: string, meta: Record<string, string>, excerpt: string }>
}
interface PagefindApi {
  init: () => Promise<void>
  search: (term: string) => Promise<{ results: PagefindResult[] }>
}

type SearchResult = Awaited<ReturnType<typeof loadPage>>

const PAGE_SIZE = 10
const DEBOUNCE_MS = 200

let pagefind: Promise<PagefindApi | null> | undefined
function loadPagefind() {
  // init() pagefind if its not already loaded
  if (!pagefind) {
    pagefind = (async () => {
      try {
        const pf = (await import(/* @vite-ignore */ `${import.meta.env.BASE_URL}pagefind/pagefind.js`)) as PagefindApi
        await pf.init()
        return pf
      }
      catch {
        return null
      }
    })()
  }
  return pagefind
}

export default function DataDictionarySearch({ defaultFields }: { defaultFields: DefaultField[] }) {
  const [query, setQuery] = useState('')
  const [data, setData] = useState<SearchResult | null>(null)
  const resultsTop = useRef<HTMLDivElement>(null)
  const latestTerm = useRef('')

  const term = query.trim()
  const status = term === ''
    ? 'idle'
    : !data
        ? 'pending'
        : data.total === 0
          ? 'empty'
          : 'success'
  const totalPages = data ? Math.ceil(data.total / PAGE_SIZE) : 0

  // Announced politely on every change
  const liveMessage = !data
    ? ''
    : data.total === 0
      ? `No fields match ${term}`
      : `Showing ${(data.page - 1) * PAGE_SIZE + 1}-${(data.page - 1) * PAGE_SIZE + data.matches.length} of ${data.total} results`

  // Debounce the search until typing settles
  const debouncedSearch = useDebouncedCallback(async (trimmed: string) => {
    const results = await runSearch(trimmed)
    if (latestTerm.current !== trimmed)
      return
    const page = await loadPage(results, 1)
    if (latestTerm.current === trimmed)
      setData(page)
  }, DEBOUNCE_MS)

  function handleInput(value: string) {
    setQuery(value)
    const trimmed = value.trim()
    latestTerm.current = trimmed

    // Clear results immediately when input is empty
    if (trimmed === '') {
      debouncedSearch.cancel()
      setData(null)
      return
    }

    debouncedSearch(trimmed)
  }

  async function goToPage(page: number) {
    setData(await loadPage(data?.results ?? [], page))

    resultsTop.current?.focus({ preventScroll: true })
    resultsTop.current?.scrollIntoView({ block: 'start' })
  }

  return (
    <div>
      <div>
        <label class="usa-sr-only" for="data-dictionary-search-input">
          Search all data dictionary fields
        </label>
        <div class="usa-input-group maxw-none">
          <div class="usa-input-prefix" aria-hidden="true" style="pointer-events: none;">
            <div style={{ fill: 'currentColor' }} dangerouslySetInnerHTML={{ __html: SearchIcon }} />
          </div>
          <input
            id="data-dictionary-search-input"
            type="search"
            class="usa-input margin-top-1 maxw-none height-5 float-none border-right"
            autoComplete="off"
            value={query}
            onInput={e => handleInput((e.target as HTMLInputElement).value)}
          />
          <div class="usa-sr-only" aria-live="polite">
            {liveMessage}
          </div>
        </div>

      </div>

      <div ref={resultsTop} tabindex={-1} style="scroll-margin-top: 14rem; outline: none;">
        {status === 'idle' && (
          <CardList>
            {defaultFields.map(field => (
              <Card
                key={field.url}
                match={{
                  url: field.url,
                  meta: { title: field.fieldName, sourceColumn: field.sourceColumn ?? '' },
                  excerpt: '',
                }}
              >
                {field.description}
              </Card>
            ))}
          </CardList>
        )}

        {status === 'pending' && <SearchSkeleton />}

        {status === 'empty' && (
          <p class="margin-top-2">
            No fields match “
            {term}
            ”.
          </p>
        )}

        {status === 'success' && (
          <>
            <CardList>
              {data?.matches.map(match => <Card key={match.url} match={match} />)}
            </CardList>
            {totalPages > 1 && <Pagination currentPage={data?.page ?? 1} totalPages={totalPages} onNavigate={goToPage} />}
          </>
        )}
      </div>
    </div>
  )
}

async function runSearch(term: string) {
  const pf = await loadPagefind()
  return pf ? (await pf.search(term)).results : []
}

async function loadPage(results: PagefindResult[], page: number) {
  const slice = results.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)
  const matches = await Promise.all(slice.map(r => r.data()))
  return {
    matches,
    total: results.length,
    page,
    results,
  }
}

function SearchSkeleton() {
  return (
    <CardList>
      {Array.from({ length: PAGE_SIZE }, (_, i) => (
        <CardWrapper key={i}>
          <div class="height-4 width-mobile bg-primary-lighter opacity-50"></div>
          <div class="margin-top-2">
            <div class="height-2 width-tablet bg-primary-lighter opacity-50 margin-top-1"></div>
            <div class="height-2 width-tablet bg-primary-lighter opacity-50 margin-top-1"></div>
            <div class="height-2 width-mobile-lg bg-primary-lighter opacity-50 margin-top-1"></div>
          </div>
        </CardWrapper>
      ))}
    </CardList>
  )
}

function Card({ match, children }: { match: SearchResult['matches'][number], children?: preact.ComponentChildren }) {
  return (
    <CardWrapper>
      <h3>
        <a href={match.url} class="stretched-link" style="outline: 0;">
          {match.meta.title}
        </a>
      </h3>
      {match.meta.sourceColumn && (
        <div class="usa-prose margin-top-1">
          <code>{match.meta.sourceColumn}</code>
        </div>
      )}
      {children
        ? (
            <p>
              {children}
            </p>
          )
        : match.excerpt
          ? (
              <p dangerouslySetInnerHTML={{ __html: match.excerpt }} />
            )
          : null}
    </CardWrapper>
  )
}

function CardWrapper({ children }: { children: preact.ComponentChildren }) {
  return (
    <li class="usa-card__container focus-ring-within margin-0 maxw-none">
      <div class="usa-card__body padding-105 position-relative">
        {children}
      </div>
    </li>
  )
}

function CardList({ children }: { children: preact.ComponentChildren }) {
  return (
    <ul class="padding-0 display-flex flex-column width-full" style="gap: 1rem;">
      {children}
    </ul>
  )
}
