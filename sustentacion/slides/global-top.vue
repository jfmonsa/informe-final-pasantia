<!--
Capa global superior: pie de página con numeración "X / total" y franja roja.
Se oculta en la portada (slide 1). Estilos en style.css (.deck-footer).

Notas de implementación:
- Va en `global-top.vue` (no `global-bottom.vue`): la capa "bottom" queda DETRÁS
  del fondo blanco opaco de `.slidev-layout` y no se vería.
- `useNav()` de @slidev/client resuelve la página también en el modo print/export
  a PDF, donde cada slide impresa provee su propio contexto de navegación fijo.
-->
<script setup lang="ts">
import { useNav } from '@slidev/client'

const { currentPage, total } = useNav()
</script>

<template>
  <footer v-if="currentPage > 1" class="deck-footer">
    <span class="footer-title">Plataforma Paralegales — Sustentación de trabajo de grado</span>
    <span class="footer-page">{{ currentPage }} / {{ total }}</span>
  </footer>
</template>
