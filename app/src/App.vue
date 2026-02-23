<template>
  <nav>
    <img src="/moon.svg" alt="cratervar" class="nav-logo" />
    <RouterLink to="/">Home</RouterLink>
    <RouterLink to="/projects">Projects</RouterLink>
    <a href="/ootp-missions-27/">OOTP Missions</a>
  </nav>
  <RouterView />
</template>

<style>
:root {
  --accent: #22c55e;
  --accent-hover: #16a34a;
  --text-primary: #1e293b;
  --text-muted: #64748b;
  --border: #e2e8f0;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: Inter, system-ui, sans-serif;
  color: var(--text-primary);
  background: #fff;
  font-size: 15px;
  line-height: 1.6;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
}

nav {
  display: flex;
  align-items: center;
  gap: 1.25rem;
  padding: 0.55rem 1.25rem;
  border-bottom: 1px solid var(--border);
  background: #fff;
}

.nav-logo {
  width: 32px;
  height: 32px;
}

nav a {
  text-decoration: none;
  color: var(--text-muted);
  font-size: 0.875rem;
}

nav a.router-link-active {
  color: var(--text-primary);
  font-weight: 600;
}

main {
  padding: 3rem 2rem;
  max-width: 700px;
}

main h1 {
  font-size: 1.75rem;
  font-weight: 700;
  margin-bottom: 1rem;
  color: var(--text-primary);
}

main h2 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-top: 1.5rem;
  margin-bottom: 0.75rem;
  color: var(--text-primary);
}

main h3 {
  font-size: 1rem;
  font-weight: 600;
  margin-top: 1.25rem;
  margin-bottom: 0.5rem;
  color: var(--text-primary);
}

main p {
  margin-bottom: 1rem;
  color: var(--text-muted);
}

main ul,
main ol {
  padding-left: 1.5rem;
  margin-bottom: 1rem;
  color: var(--text-muted);
}

main li {
  line-height: 1.6;
}

main a {
  color: var(--accent);
  text-decoration: none;
}

main a:hover {
  color: var(--accent-hover);
}

main hr {
  margin: 2rem 0;
  border: none;
  border-top: 1px solid var(--border);
}
</style>
