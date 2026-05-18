import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  // GitHub Pages 部署配置
  // 部署到 https://username.github.io/repo-name/ 时需要设置 base
  // 如果部署到自定义域名，可以设置为 '/'
  base: './'
})
