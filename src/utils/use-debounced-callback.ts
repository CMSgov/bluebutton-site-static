import { useEffect, useLayoutEffect, useRef } from 'preact/hooks'

export function useDebouncedCallback<A extends unknown[]>(fn: (...args: A) => void, delay: number) {
  const timer = useRef<number>()
  const fnRef = useRef(fn)

  useLayoutEffect(() => {
    fnRef.current = fn
  })

  useEffect(() => () => window.clearTimeout(timer.current), [])

  function debounced(...args: A) {
    window.clearTimeout(timer.current)
    timer.current = window.setTimeout(() => fnRef.current(...args), delay)
  }
  debounced.cancel = () => window.clearTimeout(timer.current)
  return debounced
}
