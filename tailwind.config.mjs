/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        primary: {
          black: 'var(--color-midnight)',
          red: 'var(--color-saba-teal)',
          'red-hover': 'var(--color-saba-teal-hover)',
          'red-light': 'var(--color-saba-teal-light)',
        },
        midnight: {
          DEFAULT: '#0F172A',
          deep: '#1E3A5F',
        },
        teal: {
          brand: '#06B6D4',
          hover: '#0891B2',
          light: 'rgba(6, 182, 212, 0.1)',
          muted: 'rgba(6, 182, 212, 0.2)',
          glow: 'rgba(6, 182, 212, 0.25)',
        },
        lime: {
          ai: '#84CC16',
          light: 'rgba(132, 204, 22, 0.1)',
        },
        slate: {
          850: '#172033',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        display: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        mono: ['JetBrains Mono', 'Fira Code', 'Consolas', 'monospace'],
      },
      backgroundImage: {
        'saba-gradient': 'linear-gradient(135deg, #06B6D4, #3B82F6)',
        'dark-depth': 'linear-gradient(180deg, #0F172A, #1E3A5F)',
        'ai-glow': 'radial-gradient(circle, rgba(6, 182, 212, 0.25), transparent)',
      },
      boxShadow: {
        teal: '0 4px 20px rgba(6, 182, 212, 0.3)',
        'teal-lg': '0 8px 40px rgba(6, 182, 212, 0.2)',
      },
    },
  },
  plugins: [],
}
