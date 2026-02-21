<template>
  <main v-html="content" />
</template>

<script setup>
import content from '../content/home.md'
</script>

<style scoped>
  main {
    padding: 4rem 2rem;
    max-width: 700px;
  }

  main :deep(h1) {
    font-size: 2rem;
    margin-bottom: 1rem;
  }

  main :deep(p) {
    margin-bottom: 1rem;
  }
</style>
