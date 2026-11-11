<!--
<BackupBadge /> — rótulo discreto "Diapositiva de apoyo" para las slides
de backup (31–34), patrón de Nicolás. Se posiciona solo, arriba a la derecha.
Ver CONTRACT.md.
-->
<template>
  <span class="backup-badge">Diapositiva de apoyo</span>
</template>

<style scoped>
.backup-badge {
  position: absolute;
  top: 2.55rem;
  right: 3rem;
  border: 1px solid var(--uv-gray);
  color: var(--uv-gray);
  background: #fff;
  font-size: 0.68rem;
  font-weight: 600;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  padding: 0.22rem 0.6rem;
  border-radius: 3px;
  line-height: 1;
}
</style>
