const visibleHeadingIds = new Set<string>()
const tocLinks = document.querySelectorAll<HTMLAnchorElement>('#toc a')
const headings = document.querySelectorAll('main :is(h2,h3,h4,h5,h6)[id]')

let didScroll = false
let didClick = false
let activeId: string | undefined
window.addEventListener('scroll', () => (didScroll = true), { once: true })

const headingsObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        visibleHeadingIds.add(entry.target.id)
      }
      else {
        visibleHeadingIds.delete(entry.target.id)
      }
    })

    if (!didClick) {
      // As a user scrolls, get the latest id to enter the viewport
      // When the page first loads, get the first/top-most id in the viewport
      activeId = didScroll ? [...visibleHeadingIds].pop() : [...visibleHeadingIds][0]
    }

    if (visibleHeadingIds.size > 0) {
      tocLinks.forEach(el => el.classList.toggle('usa-current', el.getAttribute('href') === `#${activeId}`))
    }

    didClick = false
  },
  {
    rootMargin: '-100px 0px',
    threshold: 1,
  },
)

const tocHeadingIds = Array.from(tocLinks)
  .map(link => link.getAttribute('href')?.replace('#', ''))
  .filter(Boolean)

Array.from(headings)
  .filter(heading => tocHeadingIds.includes(heading.id))
  .forEach(heading => headingsObserver.observe(heading))

tocLinks.forEach((el) => {
  el.addEventListener('click', (e) => {
    didClick = true
    const href = el.getAttribute('href') || '#'
    activeId = href?.replace('#', '') || undefined
    // Prevent USWDS event from firing
    e.stopImmediatePropagation()
    // Restore native click behavior, since USWDS overrides this by default on this component
    document.location.href = href
  })
})
