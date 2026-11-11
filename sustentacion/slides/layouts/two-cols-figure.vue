<!--
Layout `two-cols-figure` — el patrón dominante del deck:
título a ancho completo, bullets a la izquierda, figura(s) con caption a la derecha.

Slots (en este orden en el markdown):
  (default)   → `# Título` de la slide (y componentes como <ObjectiveTag />)
  ::left::    → bullets / cajas de énfasis
  ::figure::  → imagen(es) + caption como línea en *cursiva*

Props opcionales desde frontmatter:
  columns: string — grid-template-columns (por defecto "1.05fr 1fr")
  figureHeight: string — max-height de las imágenes (por defecto "9.2rem")
Ver CONTRACT.md.
-->
<script setup lang="ts">
const props = defineProps<{
  columns?: string
  figureHeight?: string
}>()
</script>

<template>
  <div
    class="slidev-layout uv-two-cols-figure"
    :style="{
      ...(props.columns ? { '--tcf-cols': props.columns } : {}),
      ...(props.figureHeight ? { '--tcf-img-max-h': props.figureHeight } : {}),
    }"
  >
    <slot />
    <div class="tcf-grid">
      <div class="tcf-left">
        <slot name="left" />
      </div>
      <figure class="tcf-figure">
        <slot name="figure" />
      </figure>
    </div>
  </div>
</template>
