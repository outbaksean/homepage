<template>
  <nav>
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
  gap: 1.5rem;
  padding: 1rem 2rem;
  border-bottom: 1px solid #e5e5e5;
}

nav a {
  text-decoration: none;
  color: #555;
}

nav a.router-link-active {
  color: #1a1a1a;
  font-weight: 600;
}
</style>
