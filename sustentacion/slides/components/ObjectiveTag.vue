<!--
<ObjectiveTag letter="A" /> — chip rojo con el objetivo específico (A–D),
el hilo conductor del deck. Se posiciona solo, arriba a la derecha,
alineado con el título. Ver CONTRACT.md.
-->
<script setup lang="ts">
defineProps<{
  letter: 'A' | 'B' | 'C' | 'D'
}>()
</script>

<template>
  <span class="objective-tag">Objetivo {{ letter }}</span>
</template>

<style scoped>
.objective-tag {
  position: absolute;
  top: 2.55rem;
  right: 3rem;
  background: var(--uv-red);
  color: #fff;
  font-size: 0.72rem;
  font-weight: 700;
  letter-spacing: 0.05em;
  padding: 0.22rem 0.65rem;
  border-radius: 999px;
  line-height: 1;
}
</style>
