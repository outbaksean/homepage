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
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  margin-bottom: 0.5rem;
  overflow: hidden;
  background: #fff;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.06);
  transition: box-shadow 0.15s, border-color 0.15s;
}

.card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.card-header {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 1rem;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 0.92rem;
  font-weight: 600;
  font-family: inherit;
  color: #1e293b;
  text-align: left;
}

.card-header:hover {
  background: #f8fafc;
}

.toggle {
  font-size: 1rem;
  font-weight: 400;
  color: #64748b;
  flex-shrink: 0;
  margin-left: 1rem;
}

.card-body {
  padding: 0 1rem 1rem;
  font-size: 0.875rem;
  color: #64748b;
  border-top: 1px solid #e2e8f0;
}
</style>
