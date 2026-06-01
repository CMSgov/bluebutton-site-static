import { getInstanceManager } from '@pagefind/component-ui'

const instance = getInstanceManager().getInstance('default')
const defaultList = document.getElementById('default-list')!
const searchList = document.getElementById('search-list')!

const placeholderHtml = (
  document.querySelector<HTMLScriptElement>('script[type="text/pagefind-template"][data-template="placeholder"]')?.textContent ?? ''
).trim()

function fillPlaceholder() {
  const container = searchList.querySelector<HTMLElement>('.pf-results')
  if (container)
    container.innerHTML = placeholderHtml
}

instance.on('search', (...args) => {
  const term = String(args[0] ?? '').trim()
  const searching = term.length > 0
  if (searching) {
    fillPlaceholder()
  }
  defaultList.hidden = searching
  searchList.hidden = !searching
})

instance.on('loading', () => {
  fillPlaceholder()
})
