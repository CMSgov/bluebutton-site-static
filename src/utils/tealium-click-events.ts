import { SITE_METADATA } from './constants'

const baseUrl = SITE_METADATA.url

// Wait for USWDS js to finish
document.addEventListener('DOMContentLoaded', () => {
  const n_a = 'not applicable'

  const links = document.querySelectorAll('a')
  links.forEach((linkEl) => {
    const tocContainer = document.getElementById('toc')
    if (!linkEl.hasAttribute('data-tealium') && !tocContainer?.contains(linkEl)) {
      linkEl.addEventListener('click', () => {
        const currentTarget = linkEl

        if (currentTarget.href.startsWith(baseUrl)) {
          // internal link clicked
          utag.link({
            event_name: 'internal_link_clicked',
            link_type: 'link_other',
            link_url: linkEl.href,
            parent_component_heading: n_a,
            parent_component_type: n_a,
            text: linkEl.textContent,
          })
        }
        else {
          // external link clicked
          utag.link({
            event_name: 'external_link_click',
            text: currentTarget.textContent,
            link_type: 'link_external',
            link_url: currentTarget.href,
            parent_component_heading: n_a,
            parent_component_type: n_a,
          })
        }
      })
    }
  })

  // button clicks
  const buttons = document.querySelectorAll('[data-tealium="copy_button"]')
  buttons.forEach((buttonEl) => {
    buttonEl.addEventListener('click', () => {
      const currentTarget = buttonEl

      utag.link({
        event_name: 'button_engagement',
        button_style: n_a,
        button_type: 'button',
        link_type: 'link_other',
        link_url: n_a,
        parent_component_heading: n_a,
        parent_component_type: n_a,
        text: currentTarget.textContent,
      })
    })
  })

  // accordion clicks
  const accordions = document.querySelectorAll('[data-tealium="accordion"]')
  accordions.forEach((accordionEl) => {
    accordionEl.addEventListener('click', () => {
      const currentTarget = accordionEl
      if (currentTarget.getAttribute('aria-expanded') === 'false') {
        utag.link({
          event_name: 'accordion_opened',
          heading: currentTarget.textContent,
          parent_component_heading: n_a,
          parent_component_type: n_a,
        })
      }
    })
  })

  // file downloads
  const downloads = document.querySelectorAll('[data-tealium="download"]')
  downloads.forEach((downloadEl) => {
    downloadEl.addEventListener('click', () => {
      const currentTarget = downloadEl as HTMLAnchorElement

      utag.link({
        event_name: 'file_download',
        file_name: currentTarget.pathname.split('/').pop(),
        file_extension: currentTarget.href.split('.').pop(),
        file_postDate: n_a,
        link_type: 'link_download',
        link_url: currentTarget.href,
        text: currentTarget.textContent,
      })
    })
  })

  // Navigation clicks
  const mainNavEls = document.querySelectorAll('[data-tealium="main_nav"]')
  const identifierEls = document.querySelectorAll('[data-tealium="identifier"]')
  const leftRailEls = document.querySelectorAll('[data-tealium="left_rail"]')
  const footerEls = document.querySelectorAll('[data-tealium="footer"]')
  const tocEls = document.querySelectorAll('[data-tealium="toc"] a');

  [
    ...mainNavEls,
    ...identifierEls,
    ...leftRailEls,
    ...tocEls,
    ...footerEls,
  ].forEach((navigationEl) => {
    navigationEl.addEventListener('click', () => {
      const currentTarget = navigationEl as HTMLAnchorElement
      const navigation_type = currentTarget.getAttribute('data-tealium') || 'right_rail'

      let heading = n_a

      if (navigation_type === 'right_rail') {
        heading = 'On this page'
      }
      else if (navigation_type === 'left_rail') {
        const closest = navigationEl?.closest('.usa-sidenav > .usa-sidenav__item')?.querySelector('a')

        // Only track "parent" element as heading, ignore if clicked element was the "parent"
        if (closest && closest !== navigationEl) {
          heading = closest.textContent
        }
      }
      else if (navigation_type === 'main_nav') {
        const closest = navigationEl.closest('.usa-nav__primary .usa-nav__primary-item')?.querySelector('button')

        // Only track "parent" element as heading, ignore if clicked element was the "parent"
        if (closest && closest !== navigationEl) {
          heading = closest.textContent
        }
      }

      utag.link({
        event_name: 'navigation_clicked',
        heading,
        link_type: 'link_other',
        link_url: currentTarget.href,
        navigation_type,
        text: currentTarget.innerText,
      })
    })
  })
})
