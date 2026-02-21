<template>
  <main>
    <h1>Active Projects</h1>
    <ProjectCard :content="cratervar" />
    <ProjectCard :content="ootp_missions" />
    <h2>Possible Future Projects</h2>
    <ProjectCard :content="ideas" />
  </main>
</template>

<script setup>
  import cratervar from "../content/cratervar.md";
  import ootp_missions from "../content/ootp_missions.md";
  import ideas from "../content/ideas.md";
  import ProjectCard from "../components/ProjectCard.vue";
</script>
