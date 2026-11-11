<!--
Layout `grid-2x2` — cuadrícula de 4 cajas de colores (slide del problema).
Slots (en este orden en el markdown):
  (default) → `# Título` de la slide
  ::box1:: … ::box4:: → contenido de cada caja
    (primera línea en **negrita** = título de la caja)
Ver CONTRACT.md.
-->
<template>
  <div class="slidev-layout uv-grid-2x2">
    <slot />
    <div class="grid-boxes">
      <div class="grid-box box-1"><slot name="box1" /></div>
      <div class="grid-box box-2"><slot name="box2" /></div>
      <div class="grid-box box-3"><slot name="box3" /></div>
      <div class="grid-box box-4"><slot name="box4" /></div>
    </div>
  </div>
</template>
