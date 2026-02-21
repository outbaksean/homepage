<template>
  <main>
    <h1>Active Projects</h1>
    <ProjectCard :content="ootp_missions" />
  </main>
</template>

<script setup>
  import ootp_missions from "../content/ootp_missions.md";
  import ProjectCard from "../components/ProjectCard.vue";
</script>
