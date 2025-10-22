import { cva } from 'cva'

export const accordion = cva({
  base: 'usa-accordion',
  variants: {
    bordered: {
      true: 'usa-accordion--bordered',
    },
    multiselectable: {
      true: 'usa-accordion--multiselectable',
    },
  },
})
