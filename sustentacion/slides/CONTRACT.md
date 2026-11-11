# CONTRATO de layouts y componentes — Fase 1 (congelado)

Este documento es la referencia obligatoria para escribir las slides de la Fase 2.
No inventar layouts, componentes ni estilos nuevos: si algo falta, se discute antes.

Plan maestro: `../plan-diapositivas.md` (estructura de las 30+4 slides, §2; reglas de diseño, §4).

## Reglas de densidad y estilo (del §4 del plan — OBLIGATORIAS)

1. **Máximo 5–6 bullets por slide, una línea por bullet.** Texto largo solo en 3 slides:
   pregunta problema (6), objetivo general (7), idea central (2).
2. **Máximo UNA `<EmphasisBox>` por slide**, y solo en slides clave.
3. **Toda slide de desarrollo o resultados lleva evidencia visual** (captura, diagrama o
   tabla). Nunca solo texto en esos bloques.
4. **Etiquetar con `<ObjectiveTag letter="…" />`** las slides de desarrollo/resultados que
   correspondan a un objetivo específico A–D (hilo conductor).
5. **Separador `section-divider` antes de cada bloque** con la sección activa resaltada.
6. Tiempos por slide como **notas del presentador** (`<!-- ... -->`), nunca impresos.
7. Formato 16:9, fondo blanco, rojo vinotinto institucional (`--uv-red: #a6192e`).
   No introducir otros colores fuera de los definidos en `style.css`.
8. Las figuras viven en `public/figures/` y se referencian como `/figures/nombre.png`
   (mapeo origen→destino en `README.md`).

## Layouts (`layouts/*.vue`)

### `cover` — portada (solo slide 1)

Todo el contenido va en el markdown; el layout solo centra. Clases CSS disponibles:
`cover-escudo` (img), `cover-subtitle`, `cover-author`, `cover-institution` (divs).
Ejemplo real ya escrito: `pages/00-apertura.md`.

### `section-divider` — índice de secciones (separador de bloque)

Sin contenido en el cuerpo: todo por frontmatter.

```yaml
---
layout: section-divider
current: 4            # índice 1-based de la sección activa
sections:             # LISTA CANÓNICA — copiar tal cual, no reordenar
  - Contexto y problema
  - Objetivos y alcance
  - Metodología
  - Desarrollo
  - Demo
  - Resultados
  - Conclusiones y trabajo futuro
---
```

### `two-cols-figure` — bullets izquierda + figura(s) derecha (patrón dominante)

Orden de slots en el markdown (obligatorio):

```md
---
layout: two-cols-figure
# opcional: columns: 1.2fr 1fr   (grid-template-columns; por defecto 1.05fr 1fr)
# opcional: figureHeight: 16rem  (max-height de las imágenes; por defecto 9.2rem)
---

# Título de la slide

<ObjectiveTag letter="A" />      <!-- si aplica; va junto al título, antes de ::left:: -->

::left::

- máximo 5–6 bullets de una línea
- (opcional, al final) UNA <EmphasisBox>

::figure::

![alt descriptivo](/figures/nombre.png)

*Caption en cursiva bajo la(s) figura(s) — se estila solo*
```

- Admite 1 o 2 imágenes en `::figure::` (cada una se limita a ~9rem de alto; con 2
  imágenes verificar legibilidad en el render).
- El caption es SIEMPRE una línea en `*cursiva*` al final del slot `figure`.
- Ejemplos reales ya escritos: slide 17 en `pages/04-desarrollo.md`, slide 23 en
  `pages/06-resultados.md` — usarlos como referencia de densidad.

### `grid-2x2` — cuadrícula de 4 cajas de colores (slide 5: el problema)

```md
---
layout: grid-2x2
---

# Título de la slide

::box1::

**Título de la caja**

Una o dos líneas de texto.

::box2::
…(igual)… ::box3:: … ::box4::
```

Colores por caja fijados en CSS (rojo, azul, verde azulado, ocre) — no configurables.
Demo en `pages/01-contexto-problema.md` (se reemplaza en Fase 2).

### `default` (theme-default) — el resto de slides

Título `# …` con barra roja automática + bullets/tablas. Para dos columnas simples sin
figura puede usarse el layout `two-cols` del tema por defecto con `::right::`.

## Componentes (`components/*.vue`, auto-importados en el markdown)

### `<EmphasisBox title="Idea central">…texto plano…</EmphasisBox>`

- Caja con borde izquierdo rojo y fondo rosado tenue.
- Prop `title` (opcional): rótulo en mayúsculas ("Idea central", "Criterio de éxito",
  "Restricción", "Cierre"…).
- Contenido: texto plano corto (1–3 líneas). Evitar markdown complejo dentro.
- Máximo una por slide (regla 2).

### `<div class="objective-statement">…</div>`

- No es un componente: es una clase de `style.css`. Enunciado literal del objetivo
  específico, plegado bajo el título a ancho completo (reemplaza los interstitials A–D).
- Va en el slot **default** del layout `two-cols-figure` (después del `<ObjectiveTag>`,
  antes de `::left::`). Una sola vez por slide, y solo en la **primera** slide de cada
  objetivo: 17 (A), 19 (B), 21 (C) y 22 (D).
- Dejar líneas en blanco alrededor del texto dentro del `<div>` para que Slidev procese
  el markdown interno.

### `<ObjectiveTag letter="A" />`

- Prop `letter`: `'A' | 'B' | 'C' | 'D'` (obligatoria).
- Chip rojo "Objetivo X" auto-posicionado arriba a la derecha, alineado con el título.
- Colocarlo inmediatamente después del `# Título` de la slide.
- A = lógica al servidor (BFF) · B = modularización FE/BE · C = observabilidad + IaC ·
  D = QA continuo.

### `<BackupBadge />`

- Sin props. Rótulo gris discreto "Diapositiva de apoyo" arriba a la derecha.
- Obligatorio en TODAS las slides de apoyo: `pages/08-backup.md`, `09-apoyo-pruebas.md`,
  `10-apoyo-arquitectura.md` y `11-apoyo-features.md`.
- No combinar con `<ObjectiveTag>` en la misma slide (al mover una slide del guion a
  apoyo, se cambia el `<ObjectiveTag>` por el `<BackupBadge>`).

## Infraestructura ya resuelta (no tocar desde las slides)

- Pie de página "X / total" + franja roja: `global-top.vue` (oculto en la portada).
- Tipografía, bullets cuadrados rojos, tablas con cabecera roja, barra roja bajo `h1`:
  `style.css`.
- Notas del presentador: comentario HTML `<!-- … -->` al final de cada slide.
