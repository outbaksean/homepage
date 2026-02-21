<template>
  <div class="card" :class="{ open }">
    <button class="card-header" @click="open = !open">
      <span v-html="title" />
      <span class="toggle">{{ open ? '-' : '+' }}</span>
    </button>
    <div v-if="open" class="card-body" v-html="body" />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  content: { type: String, required: true },
})

const open = ref(false)

const parsed = computed(() => {
  const doc = new DOMParser().parseFromString(props.content, 'text/html')
  const h1 = doc.querySelector('h1')
  const title = h1 ? h1.innerHTML : ''
  h1?.remove()
  return { title, body: doc.body.innerHTML }
})

const title = computed(() => parsed.value.title)
const body = computed(() => parsed.value.body)
</script>

<style scoped>
.card {
  border: 1px solid #e5e5e5;
  border-radius: 6px;
  margin-bottom: 1rem;
  overflow: hidden;
}

.card-header {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 1.25rem;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 1.25rem;
  font-weight: 700;
  font-family: inherit;
  color: #1a1a1a;
  text-align: left;
}

.card-header:hover {
  background: #f9f9f9;
}

.toggle {
  font-size: 1.25rem;
  font-weight: 400;
  flex-shrink: 0;
  margin-left: 1rem;
}

.card-body {
  padding: 0 1.25rem 1.25rem;
}
</style>
