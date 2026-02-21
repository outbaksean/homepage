import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { marked } from 'marked'

function markdownPlugin() {
  return {
    name: 'markdown',
    transform(src, id) {
      if (!id.endsWith('.md')) return
      return `export default ${JSON.stringify(marked(src))}`
    },
  }
}

export default defineConfig({
  plugins: [vue(), markdownPlugin()],
})
