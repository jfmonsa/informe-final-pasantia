<!--
Layout `section-divider` — índice de secciones con la sección activa en rojo
(patrón "Contenido" de José). Props desde el frontmatter de la slide:
  sections: string[]  — lista de secciones del deck (canónica en CONTRACT.md)
  current: number     — índice 1-based de la sección activa
Ver CONTRACT.md.
-->
<script setup lang="ts">
defineProps<{
  sections: string[]
  current: number
}>()
</script>

<template>
  <div class="slidev-layout uv-section-divider">
    <h1>Contenido</h1>
    <ol class="divider-list">
      <li
        v-for="(section, i) in sections"
        :key="section"
        :class="{ active: i + 1 === current }"
      >
        {{ section }}
      </li>
    </ol>
    <slot />
  </div>
</template>
