# Diapositivas — Sustentación de trabajo de grado (Slidev)

Deck de la sustentación (30 slides + 4 de apoyo). Plan maestro:
[`../plan-diapositivas.md`](../plan-diapositivas.md). Contrato de layouts/componentes
para escribir slides: [`CONTRACT.md`](./CONTRACT.md).

## Comandos

```bash
pnpm install                # una vez
pnpm dev                    # preview en vivo (http://localhost:3030)
pnpm build                  # sitio estático en dist/
pnpm export                 # PDF final en dist/sustentacion.pdf
pnpm export:preview         # PDF de revisión en dist/sustentacion-preview.pdf
```

El export a PDF usa `playwright-chromium` (devDependency). Si el navegador no está
descargado: `npx playwright install chromium`.

## Estructura

- `slides.md` — frontmatter global (16:9, tema); importa un archivo por bloque vía `src:`.
- `pages/00-apertura.md` … `pages/08-backup.md` — un archivo por bloque del plan (§2).
- `layouts/` — `cover`, `section-divider`, `two-cols-figure`, `grid-2x2`.
- `components/` — `EmphasisBox`, `ObjectiveTag`, `BackupBadge`.
- `style.css` — tema institucional (rojo vinotinto Univalle sobre blanco).
- `global-top.vue` — pie de página "X / total" con franja roja (capa global sobre cada slide).
- `public/figures/` — figuras del informe, renombradas (mapeo abajo).

## Mapeo de figuras (origen `../../img/figures/` → `public/figures/`)

| Origen (informe) | Destino (deck) | Uso (slide del plan) |
|---|---|---|
| `fig10-plane-kanban-board.png` | `plane-kanban-board.png` | 11 |
| `fig12-telegram.png` | `telegram-comunicacion-equipo.png` | 11 |
| `fig13-telegram.png` | `telegram-alertas.png` | 19 |
| `fig14-api-gateway.png` (⚠ duplicado con `fig14-base-datos-firestore.png`) | `arquitectura-api-gateway.png` | 13 |
| `fig17-sso-google.png` | `sso-google.png` | 17 |
| `fig23-dashboard-procesos.png` | `dashboard-procesos.png` | 3 |
| `fig27-my-processes-view.png` | `my-processes-view.png` | 17 |
| `fig28-seguimiento-activo.png` (⚠ duplicado con `fig28-seguimiento-activo-success.png`) | `seguimiento-activo.png` | 17 |
| `fig29-campaings-table.png` | `campanas-tabla.png` | 18 |
| `fig33-dashboard-observabilidad.png` | `dashboard-observabilidad.png` | 19 |
| `fig35-resultado-bff-red.png` | `resultado-bff-trafico-red.png` | 23 |
| `fig37-resultado-traza-correlacionada.png` | `resultado-traza-correlacionada.png` | 25 |
| `fig38-resultado-commit-rechazado.png` | `resultado-commit-rechazado.png` | 26 |
| `fig39-resultado-ci.png` | `resultado-ci-pipeline.png` | 26 |
| `fig40-pruebas-rules-run.png` | `pruebas-rules-run.png` | 22 |
| `../template/univalle-escudo.jpg` | `../univalle-escudo.jpg` (raíz de `public/`) | 1 (portada) |

Notas sobre duplicados del informe: en el origen existen dos `fig14`, dos `fig20`, dos
`fig28` y dos `fig9`; solo se copiaron los archivos que el plan referencia, con nombres
descriptivos sin número para eliminar la ambigüedad.

## Estado (Fase 2)

Contenido completo de los 9 bloques: 30 slides + 4 de apoyo + 8 separadores de sección
(42 páginas). La slide 13 (arquitectura híbrida global) es un **borrador Mermaid**
marcado `<!-- BORRADOR Fase 3: iterar -->`. Notas del presentador con guion y tiempos
en cada slide. QA visual sobre PNG (`dist/qa-png/`) aprobada. PDF de revisión:
`dist/sustentacion-preview.pdf`. Pendiente Fase 3 (iterar diagrama + demos) y
Fase 4 (ensayo cronometrado, export final).
