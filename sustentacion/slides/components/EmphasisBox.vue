<!--
<EmphasisBox> — caja de énfasis roja con título opcional
(patrón "Idea central" / "Criterio de éxito" / "Cierre" de Nicolás).
Máximo UNA por slide. Ver CONTRACT.md.
-->
<script setup lang="ts">
defineProps<{
  title?: string
}>()
</script>

<template>
  <div class="emphasis-box">
    <div v-if="title" class="emphasis-box-title">{{ title }}</div>
    <div class="emphasis-box-body">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.emphasis-box {
  margin-top: 0.9rem;
  border-left: 5px solid var(--uv-red);
  background: var(--uv-red-tint);
  border-radius: 0 4px 4px 0;
  padding: 0.6rem 0.9rem;
  font-size: 0.92rem;
  line-height: 1.45;
}

.emphasis-box-title {
  font-weight: 700;
  color: var(--uv-red-dark);
  text-transform: uppercase;
  letter-spacing: 0.04em;
  font-size: 0.72rem;
  margin-bottom: 0.25rem;
}

.emphasis-box-body :deep(p) {
  margin: 0;
}
</style>
