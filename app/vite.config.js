import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { marked } from 'marked'
import { readFileSync } from 'fs'

function markdownPlugin() {
  return {
    name: 'markdown',
    transform(src, id) {
      if (!id.endsWith('.md')) return
      const html = marked(readFileSync(id, 'utf-8'))
      return `export default ${JSON.stringify(html)}`
    },
  }
}

export default defineConfig({
  plugins: [vue(), markdownPlugin()],
})
