import navigateBefore from '@uswds/uswds/img/usa-icons/navigate_before.svg?raw'
import navigateNext from '@uswds/uswds/img/usa-icons/navigate_next.svg?raw'
import { cva } from 'cva'

interface PaginationProps {
  currentPage: number
  totalPages: number
  onNavigate: (page: number) => void
}

const MAX_SLOTS = 7

// From the @trussworks/react-uswds implementation: https://github.com/trussworks/react-uswds/blob/main/src/components/Pagination/Pagination.tsx
function getPageRange(currentPage: number, totalPages: number): (number | 'overflow')[] {
  if (totalPages <= MAX_SLOTS)
    return Array.from({ length: totalPages }, (_, i) => i + 1)

  const middleSlot = Math.round(MAX_SLOTS / 2)
  const showPrevOverflow = currentPage > middleSlot
  const showNextOverflow = totalPages - currentPage >= middleSlot

  const prevSlots = currentPage === 1 ? 0 : showPrevOverflow ? 2 : 1
  const nextSlots = currentPage === totalPages ? 0 : showNextOverflow ? 2 : 1
  const pageRangeSize = MAX_SLOTS - 1 - (prevSlots + nextSlots) // minus 1 for the current page

  let beforeSize = 0
  let afterSize = 0
  if (showPrevOverflow && showNextOverflow) {
    // Middle of the set: overflow at both ends, e.g. [1] … [9] [10] [11] … [24]
    beforeSize = Math.round((pageRangeSize - 1) / 2)
    afterSize = pageRangeSize - beforeSize
  }
  else if (showPrevOverflow) {
    // End of the set: overflow at the start, e.g. [1] … [20] [21] [22] [23] [24]
    afterSize = Math.max(totalPages - currentPage - 1, 0)
    beforeSize = pageRangeSize - afterSize
  }
  else if (showNextOverflow) {
    // Start of the set: overflow at the end, e.g. [1] [2] [3] [4] [5] … [24]
    beforeSize = Math.max(currentPage - 2, 0)
    afterSize = pageRangeSize - beforeSize
  }

  const range: (number | 'overflow')[] = [currentPage]
  for (let i = 1; i <= beforeSize; i++)
    range.unshift(currentPage - i)
  for (let i = 1; i <= afterSize; i++)
    range.push(currentPage + i)

  if (showPrevOverflow)
    range.unshift('overflow')
  if (currentPage !== 1)
    range.unshift(1)
  if (showNextOverflow)
    range.push('overflow')
  if (currentPage !== totalPages)
    range.push(totalPages)

  return range
}

const nextPrevStyles = cva({
  base: 'usa-pagination__link border-0 padding-0 bg-transparent cursor-pointer display-flex flex-align-center',
  variants: {
    dir: {
      prev: 'usa-pagination__previous-page',
      next: 'usa-pagination__next-page',
    },
  },
})

export default function Pagination({ currentPage, totalPages, onNavigate }: PaginationProps) {
  return (
    <nav aria-label="Pagination" class="usa-pagination">
      <ul class="usa-pagination__list">
        {currentPage > 1 && (
          <li class="usa-pagination__item usa-pagination__arrow">
            <button type="button" class={nextPrevStyles({ dir: 'prev' })} aria-label="Previous page" onClick={() => onNavigate(currentPage - 1)}>
              <div class="usa-icon display-flex flex-align-center" dangerouslySetInnerHTML={{ __html: navigateBefore }} />
              <span class="usa-pagination__link-text">Previous</span>
            </button>
          </li>
        )}

        {getPageRange(currentPage, totalPages).map((item, i) =>
          item === 'overflow'
            ? (
                <li class="usa-pagination__item usa-pagination__overflow" key={`overflow-${i}`} aria-label="ellipsis indicating non-visible pages">
                  <span>…</span>
                </li>
              )
            : (
                <li class="usa-pagination__item usa-pagination__page-no" key={item}>
                  <button
                    type="button"
                    class={`usa-pagination__button bg-white cursor-pointer ${item === currentPage ? 'usa-current' : ''}`}
                    style={{
                      textDecoration: 'none',
                    }}
                    aria-label={`Page ${item}`}
                    aria-current={item === currentPage ? 'page' : undefined}
                    onClick={() => onNavigate(item)}
                  >
                    {item}
                  </button>
                </li>
              ),
        )}

        {currentPage < totalPages && (
          <li class="usa-pagination__item usa-pagination__arrow">
            <button type="button" class={nextPrevStyles({ dir: 'next' })} aria-label="Next page" onClick={() => onNavigate(currentPage + 1)}>
              <span class="usa-pagination__link-text">Next</span>
              <div class="usa-icon display-flex flex-align-center" dangerouslySetInnerHTML={{ __html: navigateNext }} />
            </button>
          </li>
        )}
      </ul>
    </nav>
  )
}
