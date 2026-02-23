<template>
  <main>
    <div v-html="content" />
    <ProjectCard :content="session2" />
    <ProjectCard :content="session1" />
  </main>
</template>

<script setup>
  import content from "../content/home.md";
  import session1 from "../content/sessions/session_2_14_2026.md";
  import session2 from "../content/sessions/session_2_21_2026.md";
  import ProjectCard from "../components/ProjectCard.vue";
</script>
