# cratervar.com — Frontend

Vue 3 + Vite SPA. Deployed to S3 + CloudFront.

## Setup

```bash
cd app
npm install
```

## Commands

| Command | Description |
|---|---|
| `npm run dev` | Start dev server at `http://localhost:5173` |
| `npm run build` | Build to `app/dist/` |
| `npm run preview` | Preview the production build locally |

## Structure

```
app/
├── src/
│   ├── main.js          # App entry point
│   ├── App.vue          # Root component + nav
│   ├── router/          # Vue Router config
│   └── views/           # Route-level components
│       ├── HomeView.vue
│       └── ProjectsView.vue
├── index.html
├── vite.config.js
└── package.json
```

## Deploy

Build and sync to S3 manually:

```bash
npm run build
aws s3 sync dist/ s3://<bucket-name> --delete
aws cloudfront create-invalidation --distribution-id <id> --paths "/*"
```

CI/CD via GitHub Actions is set up in `../.github/workflows/`.

## Next Steps

- [ ] Replace placeholder content in `HomeView` and `ProjectsView` with real bio and project list
- [ ] Pick a styling approach — plain CSS, Tailwind, or a lightweight component library
- [ ] Add favicon and `<meta>` tags (description, OG tags) to `index.html`
- [ ] Confirm CloudFront is configured to forward 403/404 errors to `index.html` so Vue Router deep links work
- [ ] Set up GitHub Actions deploy workflow (see `../.github/workflows/`)
- [ ] Add unit and E2E tests (see Testing below)

## Testing

The goal is enough coverage to catch regressions without over-engineering a personal site.

**Unit tests — [Vitest](https://vitest.dev/) + [Vue Test Utils](https://test-utils.vuejs.org/)**

Vitest is Vite-native so no extra config is needed. Install with:

```bash
npm install -D vitest @vue/test-utils
```

Add to `package.json` scripts:

```json
"test": "vitest run",
"test:watch": "vitest"
```

What to cover:
- Each view renders without errors
- Nav links point to the correct routes
- Any components with conditional logic or props

**E2E tests — [Playwright](https://playwright.dev/)**

Catches routing and CloudFront SPA issues that unit tests miss. Install with:

```bash
npm init playwright@latest
```

What to cover:
- `/` loads and displays home content
- `/projects` loads and displays projects content
- Navigating between routes via the nav works
- Deep-linking directly to `/projects` works (validates CloudFront 404 → index.html config)
