<template>
  <nav>
    <img src="/moon.svg" alt="cratervar" class="nav-logo" />
    <RouterLink to="/">Home</RouterLink>
    <RouterLink to="/projects">Projects</RouterLink>
  </nav>
  <RouterView />
</template>

<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: system-ui, sans-serif;
  color: #1a1a1a;
  background: #fff;
}

nav {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  padding: 1rem 2rem;
  border-bottom: 1px solid #e5e5e5;
}

.nav-logo {
  width: 38px;
  height: 38px;
  margin-right: 0.5rem;
}

nav a {
  text-decoration: none;
  color: #555;
}

nav a.router-link-active {
  color: #1a1a1a;
  font-weight: 600;
}

main {
  padding: 4rem 2rem;
  max-width: 700px;
}

main h1 {
  font-size: 2rem;
  margin-bottom: 1rem;
}

main h2 {
  font-size: 1.4rem;
  margin-top: 1.5rem;
  margin-bottom: 0.75rem;
}

main h3 {
  font-size: 1.1rem;
  margin-top: 1.25rem;
  margin-bottom: 0.5rem;
}

main p {
  margin-bottom: 1rem;
  line-height: 1.6;
}

main ul,
main ol {
  padding-left: 1.5rem;
  margin-bottom: 1rem;
}

main li {
  line-height: 1.6;
}

main a {
  color: #1a1a1a;
}

main hr {
  margin: 2rem 0;
  border: none;
  border-top: 1px solid #e5e5e5;
}
</style>
