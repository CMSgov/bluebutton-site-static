import antfu from '@antfu/eslint-config'

export default antfu({
  formatters: true,
  typescript: true,
  astro: true,
  stylistic: {
    indent: 2,
    quotes: 'single',
  },
  rules: {
    'perfectionist/sort-imports': ['error', {
      type: 'natural',
    }],
  },
  ignores: [
    'src/assets/',
  ],
})
