# Plan de diapositivas — Sustentación de trabajo de grado

**Trabajo:** Evolución arquitectónica y aseguramiento de calidad de la plataforma Paralegales mediante una arquitectura híbrida Firebase y AWS (Pasantía en Modalidad de Convenio)
**Autor:** Juan Felipe Monsalve Vargas — Universidad del Valle, Sede Tuluá
**Duración objetivo:** 25 minutos máximo + demo + preguntas
**Total estimado:** 30 diapositivas principales + 4 de apoyo (backup)

---

## 1. Análisis de los ejemplos

### Ejemplo 1 — José (`presentacion-jose-ej-1.pdf`, 47 slides, 4:3)

Sigue **exactamente la estructura del informe de pasantía Univalle**: Agenda → Introducción → Descripción del problema → Formulación → Objetivos → Alcance → Metodología → Desarrollo → Pruebas → Resultados + DEMO → Conclusiones → Trabajos futuros → Bibliografía → Gracias.

**Distribución:** ~42% planteamiento (contexto/problema/objetivos/alcance), ~11% metodología, ~16% desarrollo, ~11% pruebas, ~8% resultados+demo, ~8% cierre.

**Lo que funciona bien (a imitar):**
- Slide separadora "Contenido" antes de cada sección, con la sección activa resaltada — el jurado siempre sabe dónde está.
- Patrón visual dominante: evidencia (captura/diagrama) a un lado + bloque de bullets al otro. Máximo 5 bullets por slide.
- Tablas para comunicar *razonamiento de decisiones* (criterios de selección, brechas/impacto, escenarios de prueba).
- Slide dedicada a **restricciones del alcance** — blinda contra preguntas del jurado.
- Slide "DEMO" limpia como transición a la demostración.
- Trazabilidad pregunta → objetivos → conclusiones (los cierra uno a uno).

**Lo que evitar:** 47 slides es demasiado; 13 slides de planteamiento diluyen el desarrollo; sin métricas ni datos duros en resultados.

### Ejemplo 2 — Nicolás (`presentacion-nicolas-ej-2.pdf`, 25 slides, 16:9)

Mismo contexto (Paralegales/Webcloster) y mismo director. Estructura compacta: Agenda con "Idea central" → Contexto → Problema/objetivos → Metodología → Arquitectura → Desarrollo en 4 "frentes" → Pruebas → Resultados → Tabla objetivos-resultados → Conclusiones → Trabajo futuro → Gracias → 3 slides de apoyo.

**Lo que funciona bien (a imitar):**
- **Una caja de énfasis por slide** ("Idea central", "Criterio de éxito", "Cierre") — el jurado siempre sabe cuál es el mensaje.
- Desarrollo organizado en **frentes nombrados y numerados** — hilo narrativo memorable.
- **Tabla objetivos ↔ resultados** que responde de antemano "¿cumplió los objetivos?".
- Cajas "Video sugerido" que anuncian cada demo antes de mostrarla.
- **Slides de apoyo (backup)** rotuladas, reservadas para la ronda de preguntas.
- Tiempo sugerido por slide (mejor como notas del presentador, no impreso).

**Lo que evitar:** resultados 100% cualitativos, sin cifras (tu informe SÍ tiene métricas: úsalas).

### Decisión de diseño para tu presentación

**Esqueleto formal de José** (secciones del informe Univalle, que el jurado espera) **con la disciplina y compacidad de Nicolás** (~30 slides, cajas de énfasis, frentes numerados = tus objetivos A–D, tabla objetivos-resultados, backups). Tu ventaja diferencial sobre ambos ejemplos: **resultados con evidencia dura** (16 pruebas de reglas, SLIs con umbrales, tráfico de red del BFF, traza correlacionada) — explótala.

---

## 2. Estructura propuesta (30 slides + 4 backup)

> Convención: las rutas de figuras son relativas al repo del informe (`img/figures/`).

### Bloque 0 — Apertura (slides 1–2, ~2 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 1 | **Portada** | Texto centrado + logo Univalle | Título, modalidad (convenio con Webcloster S.A.S.), autor y código, director (Ms.C Royer David Estrada Esponda), escuela, sede Tuluá, año |
| 2 | **Agenda + Idea central** | Lista numerada de secciones + caja de énfasis | Idea central sugerida: *"Evolucionar una plataforma legaltech en producción hacia una arquitectura híbrida Firebase+AWS — reubicando lógica crítica al servidor, modularizando, y añadiendo observabilidad y QA continuo — sin interrumpir el servicio."* |

### Bloque 1 — Contexto y problema (slides 3–6, ~4 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 3 | **Contexto: Paralegales** | Captura del dashboard (`fig23-dashboard-procesos.png`) + 4 bullets | Legaltech de Webcloster; seguimiento automatizado de procesos de la Rama Judicial Unificada; **en producción con usuarios reales**. Dato de contexto: congestión judicial 54,9% (CSJ 2023); Colombia 2.º en Legal Tech Index |
| 4 | **Punto de partida técnico** | Diagrama simple "antes": cliente con SDK Firebase + Lambdas sueltas | El desarrollo inicial priorizó time-to-market con Firebase (BaaS) → deuda técnica acumulada. Enmarcar como decisión *deliberada y prudente* (Kruchten), no como error |
| 5 | **El problema: 4 frentes** | Cuadrícula 2×2 de cajas (estilo slide 39 de José) | 1) Lógica de negocio crítica expuesta en el cliente (Insecure Design, OWASP); 2) Fragmentación arquitectónica Firebase/AWS; 3) Vendor lock-in parcial; 4) Sin observabilidad transversal ni QA automatizado |
| 6 | **Formulación + restricción clave** | Caja única con la pregunta central | Pregunta del informe (resumida) + caja de énfasis: *"Restricción: evolucionar SIN disrumpir producción y SIN migración total de nube (evaluada y descartada por costo-beneficio)"*. Esto anticipa la pregunta obvia del jurado |

### Bloque 2 — Objetivos y alcance (slides 7–9, ~3 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 7 | **Objetivo general** | Caja única de texto | Transcripción (casi) literal del objetivo general. Se lee/parafrasea completo |
| 8 | **Objetivos específicos A–D** | Lista numerada A–D, una línea por objetivo (versión comprimida) | **A:** Reubicar lógica crítica al servidor · **B:** Refactorizar frontend/backend con patrones modulares · **C:** Observabilidad estructurada transversal + IaC · **D:** QA continuo automatizado. *Estos 4 letras son el hilo conductor de TODA la presentación (equivalente a los "frentes" de Nicolás)* |
| 9 | **Alcance y exclusiones** | Dos columnas: "Dentro" / "Fuera" | Dentro: 4 líneas de intervención sobre módulos activos (auth, procesos, campañas). Fuera: sustituir Firebase Auth, migrar Firestore (DynamoDB evaluada y descartada), 100% AWS, features nuevas. *Imitar la slide de restricciones de José: blinda el alcance* |

### Bloque 3 — Metodología (slides 10–11, ~2 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 10 | **Metodología de investigación y desarrollo** | Bullets + referencia a tabla comparativa (dejar tabla completa en backup) | Investigación aplicada in vivo, TRL 7–9 (Colciencias); SCRUM con iteraciones semanales + prácticas XP (TDD, pair programming) + cultura DevOps/CI-CD |
| 11 | **Gestión del trabajo** | 2 capturas: Kanban Plane (`fig10-plane-kanban-board.png`) + Telegram (`fig12-telegram.png`) | Kanban en WebDesk → Plane (self-hosted); PO y Tech Lead; Meet (planning), Discord (pair programming), Telegram (async) |

### Bloque 4 — Desarrollo (slides 12–20, ~8 min) — corazón de la sustentación

Plantilla por slide (patrón de ambos ejemplos): **bullets a la izquierda + evidencia visual a la derecha**, máximo 5-6 bullets.

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 12 | **Stack tecnológico (3 repositorios)** | 3 columnas o cajas por repo | `paralegales-ui` (Nuxt 3/Vue 3, Vuetify, Pinia, Vitest — frontend **y BFF**) · `paralegales-services` (Go serverless: Lambda, API Gateway, SQS/SNS, CloudFormation) · `paralegales-admin` (Vue 3 + Vite + TS) |
| 13 | **Arquitectura híbrida global** ⭐ | **Diagrama a crear** (no existe en el informe): Cliente → BFF (Nuxt) → API Gateway → Lambdas Go → Firestore / SQS / SNS / CloudWatch + Firebase Auth + Rama Judicial/SAMAI | LA slide más importante de la presentación. Referencia parcial: `fig14-api-gateway.png`. Zonas coloreadas por proveedor (Firebase vs AWS) como el diagrama de Nicolás |
| 14 | **[A] Backend-for-Frontend** | Diagrama del proxy BFF o captura de `common/server/utils` | Patrón BFF (Newman/SoundCloud); encapsula la integración por ingeniería inversa con la API no documentada de la Rama Judicial; evita CORS, estandariza respuestas, punto único de auditoría |
| 15 | **[B] Frontend: DDD + Nuxt Layers** | Árbol de directorios (recrear el `verbatim` del informe como gráfico) | 4 niveles: `app-core/`, `common/` (shared kernel), `features/` (**9 bounded contexts**), `vendor/vuexy/` aislado. Cada feature con su `nuxt.config.ts` → evolución independiente |
| 16 | **[B] Backend: Handler–Service–Repository** | Snippet mínimo o diagrama de 3 capas con interfaz de repositorio | Handler delgado → Service (lógica) → Repository por interfaz (`repository_interface.go` / `repository_firestore.go`) → testeable con mocks y motor de persistencia sustituible (mitiga lock-in) |
| 17 | **Módulos funcionales: autenticación y procesos** | 2-3 capturas: `fig17-sso-google.png`, `fig27-my-processes-view.png`, `fig28-seguimiento-activo.png` | Firebase Auth (SSO Google, verificación de correo, reglas de Firestore como última defensa); núcleo de procesos: búsqueda vía BFF, follow/unfollow, **Seguimientos Activos** (búsqueda diaria automática contra Rama Judicial y SAMAI) |
| 18 | **Módulo campañas (event-driven)** | Diagrama: Lambda orquestadora → SQS → consumidores + captura `fig29-campaings-table.png` | Envíos masivos multicanal (email, WhatsApp/Twilio) desacoplados con SQS — el administrador no espera el envío |
| 19 | **[C] Observabilidad transversal** | Captura dashboard CloudWatch (`fig33-dashboard-observabilidad.png`) + `fig13-telegram.png` (alertas) | Interceptores HTTP en Go y en el BFF (con sanitizers de secretos); JSON estandarizado con correlation-id; alarmas → SNS → Telegram; todo aprovisionado con CloudFormation (IaC) |
| 20 | **[D] SDLC y calidad continua** | Diagrama del pipeline: Lefthook (pre-commit, commit-msg) → GitHub Actions (lint diferencial + suite de reglas) | Prettier+ESLint sobre staged files, Commitlint/Conventional Commits, CI con caché pnpm y validación diferencial; a producción solo desde la rama de integración |

### Bloque 5 — Pruebas (slides 21–22, ~3 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 21 | **Estrategia guiada por riesgo** | Tabla síntesis de los 8 mecanismos (versión comprimida de `tab:sintesis-pruebas`) | Esfuerzo asignado por riesgo, no cobertura uniforme (producción + equipo reducido). Caja de énfasis: *"Automatización obligatoria donde el riesgo es de seguridad; detección temprana donde el riesgo es funcional"* |
| 22 | **Evidencia de pruebas** | Captura `fig40-pruebas-rules-run.png` + mención CP-01…CP-06 | **16 casos** de reglas de Firestore (Vitest + Emulator Suite, matchers `toAllow`/`toDeny`) como compuerta del CI; validación manual sistemática en staging; base E2E con Playwright (POM) — no en CI, decisión documentada de costo-beneficio |

### Bloque 6 — Resultados (slides 23–26, ~5 min) — tu ventaja sobre ambos ejemplos

Una slide por objetivo, cada una con su **evidencia dura**:

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 23 | **Resultado A — Lógica fuera del cliente** | `fig35-resultado-bff-red.png` (tráfico de red) | El cliente solo llama al BFF; endpoints gubernamentales ya no visibles desde el navegador. Evidencia verificable, no afirmación |
| 24 | **Resultado B — Arquitectura modular** | Árbol de features (9 bounded contexts) + diagrama 3 capas | Nuxt Layers en frontend; Handler–Service–Repository en backend; desacoplamiento validado con unitarias con mocks |
| 25 | **Resultado C — Observabilidad operativa** | `fig37-resultado-traza-correlacionada.png` + tabla SLI comprimida | Traza correlacionada extremo a extremo (BFF→Lambda→API externa). **5 SLIs sobre 8 servicios** (namespace `Paralegales/RJU`); alarmas **RJU-High5xx** (>10 errores/5 min) y **RJU-HighLatency** (p95 > 5000 ms) → correo + Telegram. Delimitación honesta: sin SLOs/error budgets aún (falta historial) |
| 26 | **Resultado D — Calidad continua + tabla de cierre** | `fig38-resultado-commit-rechazado.png` o `fig39-resultado-ci.png` + **tabla objetivos ↔ resultados** (de `tab:sintesis_resultados`) | Commit rechazado por Commitlint (la compuerta funciona); CI operativo. La tabla cierra el ciclo académico como la slide 19 de Nicolás — responde de antemano "¿cumplió los objetivos?" |

### Bloque 7 — Demo (slide 27, tiempo aparte)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 27 | **DEMO** | Slide limpia, solo la palabra (como José) o cajas "Video sugerido" (como Nicolás) | Sugerencia de demos cortas: (1) búsqueda de proceso vía BFF con la pestaña Network abierta — demuestra el Resultado A en vivo; (2) dashboard de observabilidad + una alerta en Telegram; (3) commit rechazado + pipeline en verde. Pregrabar como videos por si falla la red (enfoque Nicolás) |

### Bloque 8 — Cierre (slides 28–30, ~3 min)

| # | Slide | Contenido visual | Puntos clave |
|---|-------|------------------|--------------|
| 28 | **Conclusiones** | 4 bullets + caja de énfasis | 1) Objetivo general cumplido **sin disrumpir producción** (la restricción definió la estrategia); 2) los 4 frentes contribuyeron al mismo fin; 3) aseguramiento deliberadamente asimétrico, con límites reconocidos; 4) reflexión: programa tipo E (Lehman) — la refactorización fue la *condición* para seguir desarrollando features; **pago selectivo de deuda técnica** (Kruchten), no liquidación |
| 29 | **Trabajo futuro** | 4-5 bullets + caja "Cierre" con la frase final | Integrar suite Go al CI; cobertura con umbral mínimo; E2E nocturno; declarar SLOs/error budgets con el historial acumulado; hooks en el repo de servicios |
| 30 | **Gracias / Preguntas** | Minimalista | — |

### Slides de apoyo / backup (31–34, rotuladas "Diapositiva de apoyo")

Para la ronda de preguntas, siguiendo el patrón de Nicolás:

| # | Slide | Uso previsto |
|---|-------|--------------|
| 31 | **Tabla comparativa SCRUM/XP/FDD** (`tab:comparativa_metodologias`) | Si preguntan por qué SCRUM |
| 32 | **Casos de prueba CP-01…CP-06** (`tab:casos-manuales`) | Si preguntan por la validación manual |
| 33 | **Marco de referencia visual** — mapa de conceptos (BFF, DDD, hexagonal, Strangler Fig, 3 pilares de observabilidad, TRL) | Si preguntan por fundamentos teóricos |
| 34 | **¿Por qué no migrar todo a AWS?** — costo/beneficio de la migración Firestore→DynamoDB descartada | Pregunta muy probable del jurado; tener la respuesta en una slide es oro |

---

## 3. Distribución y tiempos

**Presupuesto real:** ~25 min de exposición + hasta 15 min de demo en video (aparte).

Tabla **vigente** tras el recorte (la versión escrita del deck había derivado a ~37.6 min;
el bloque de Desarrollo declaraba 8 min pero sus slides sumaban ~18). Cada slide lleva su
tiempo en las notas del presentador y la suma cierra aquí:

| Bloque | Slides | Tiempo | % |
|--------|--------|--------|---|
| Apertura | 2 | ~1.5 min | 6% |
| Contexto y problema | 4 (+1 sep.) | ~3 min | 13% |
| Objetivos y alcance | 3 (+1 sep.) | ~2.5 min | 11% |
| Metodología | 1 (+1 sep.) | ~1 min | 4% |
| **Desarrollo** | **8** (+1 sep.) | **~7.75 min** | **33%** |
| Demo | 1 (+1 sep.) | aparte (≤15 min) | — |
| Resultados | 5 (+1 sep.) | ~4.5 min | 19% |
| Cierre | 3 (+1 sep.) | ~2.5 min | 11% |
| Transiciones en separadores | 7 | ~1 min | 4% |
| **Total** | **34** (+17 apoyo) | **~23.7 min** | 100% |

Se apunta a ~23.7 y no a 25 **a propósito**: los tiempos por slide son ajustados (5 bullets
densos más un diagrama en ~55 s) y el primer ensayo suele correr 20–30 % largo. El margen
es la red de seguridad, no tiempo desaprovechado.

**Qué cambió respecto de la versión larga del deck:**

1. El recorrido de módulos del producto (autenticación ×3, procesos ×5, campañas) salió del
   guion hablado: −6.3 min. Lo cuenta la demo, que tiene 15 min propios. Esas 9 slides viven
   en `11-apoyo-features.md` y sirven de índice de capítulos del video.
2. Los 4 interstitials A–D desaparecieron: −1 min. El enunciado literal de cada objetivo va
   impreso bajo el título de su primera slide (clase `.objective-statement`).
3. `Backend: Handler–Service–Repository` y `El mismo principio en el frontend` se fusionaron
   en `El patrón en capas, en los dos motores`: −40 s, y la fusión *es* el mensaje (son espejo).
4. `¿Por qué es vital la observabilidad aquí?` y `Vigilar lo que no controlamos: RJU y SAMAI`
   pasaron a apoyo: −1.7 min. El *porqué* se dice hablado en ~15 s al abrir la slide 21.
5. `Metodología` y `Gestión del trabajo` se fusionaron en una slide: −1 min. La versión
   extendida queda en apoyo.
6. Retiming general del resto (Apertura, Contexto, Objetivos, Resultados, Cierre): −2.7 min.

El bloque de Pruebas del plan original ya no existe: la slide `SDLC y calidad continua` lo
absorbió y sus dos slides quedaron como apoyo (`09-apoyo-pruebas.md`).

Comparación: José dedicó ~42% al planteamiento y solo ~16% al desarrollo; Nicolás ~32% al desarrollo. Este plan sigue la proporción de Nicolás (desarrollo + resultados = ~52% del tiempo hablado), que es la adecuada para una pasantía de implementación.

## 4. Reglas de diseño (destiladas de los ejemplos)

1. **Máximo 5-6 bullets por slide, una línea por bullet.** El texto largo solo en 3 slides: pregunta problema, objetivo general, idea central.
2. **Una caja de énfasis por slide clave** con el mensaje que el jurado debe retener (patrón Nicolás).
3. **Evidencia visual en toda slide de desarrollo/resultados**: captura real, diagrama propio o tabla. Nunca slide de solo texto en esos bloques.
4. **Los objetivos A–D como hilo conductor**: etiquetar las slides de desarrollo y resultados con [A]/[B]/[C]/[D] para que el jurado vea la trazabilidad objetivo → desarrollo → resultado → conclusión.
5. **Separadores de sección** con índice resaltado (patrón José) — opcional si se usa Beamer con `\tableofcontents[currentsection]`, aporta navegación sin esfuerzo.
6. **Crear el diagrama de arquitectura global** (slide 13): es la pieza visual que el informe no tiene y la sustentación más necesita.
7. **Tiempos por slide como notas del presentador**, no impresos en la slide (corrige el desliz de Nicolás).
8. **Formato 16:9** (como Nicolás; el 4:3 de José desperdicia los proyectores actuales) con tema Beamer institucional rojo Univalle.
9. **Delimitaciones dichas por ti antes de que las pregunte el jurado**: migración descartada (slide 6/9), E2E fuera del CI (slide 22), sin SLOs aún (slide 25). Ambos ejemplos muestran que esto blinda la sustentación.

---

## 5. Estrategia de implementación con Slidev

### Veredicto

**Fases secuenciales con checkpoint de revisión entre cada una.** Subagentes en paralelo solo en dos puntos concretos (redacción de bloques de contenido y QA visual), y solo si se cumple la precondición de la Fase 1. **No implementar todo en una sola corrida.**

### Por qué no "todo en un run"

1. **Los errores de la base se propagan a las 30 slides.** El tema (colores, tipografía, layouts) y los componentes compartidos (`<EmphasisBox>`, etiquetas [A]–[D], layout de dos columnas con figura) definen cómo se escribe *cada* slide posterior. Si se generan las 30 slides y luego se corrige el tema, se retocan 30 slides.
2. **El cuello de botella no es escribir, es la revisión visual.** Los defectos típicos de slides generadas (texto desbordado, capturas ilegibles al tamaño renderizado, densidad desigual) solo se ven al renderizar. Un checkpoint por bloque detecta el patrón defectuoso en 3-4 slides y lo corrige antes de repetirlo en 26.
3. **La slide 13 (diagrama de arquitectura) es inherentemente iterativa** — no existe en el informe y va a necesitar varias rondas de ajuste con revisión humana. No puede resolverse "de pasada" dentro de un run gigante.

### Por qué secuencial (con paralelismo acotado) y no fan-out masivo de subagentes

- Slidev compila **un solo deck**: la coherencia visual y de densidad entre slides es el atributo #1. Agentes paralelos con contextos aislados divergen en estilo (uno pone 6 bullets densos, otro 3 escuetos) salvo que el contrato de componentes esté congelado y sea explícito en cada prompt.
- El paralelismo **sí es viable** porque Slidev permite partir el deck en archivos por bloque (`---\nsrc: ./pages/04-desarrollo.md\n---`): cada agente escribe su propio archivo, sin conflictos. Pero para ~30 slides ya especificadas en este plan, el ahorro de tiempo es marginal frente al costo de consolidación. Úsalo solo si la Fase 2 se hace pesada.
- Donde los subagentes paralelos **sí pagan**: QA visual (Fase 4) — exportar las slides a PNG y lanzar un agente por bloque que revise desbordes y legibilidad es paralelismo sin riesgo de inconsistencia, porque leen, no escriben.

### Fases

**Fase 0 — Scaffold (secuencial, ~1 sesión corta)**
- `pnpm create slidev` en `sustentacion/slides/` (o repo aparte).
- Estructura: `slides.md` raíz (frontmatter global, 16:9) que importa `pages/00-apertura.md` … `pages/08-backup.md` vía `src:` — un archivo por bloque de este plan.
- Copiar de `../img/figures/` **solo las ~20 figuras que el plan referencia** a `public/figures/`, renombrándolas para resolver los duplicados de numeración del informe (hay dos `fig14`, dos `fig20`, dos `fig28`, dos `fig9`).
- Verificar que `slidev export` (PDF) funciona desde el día 0 — es el entregable final.
- ✅ Checkpoint: deck vacío renderiza y exporta.

**Fase 1 — Tema y contrato de componentes (secuencial, LA fase crítica)**
- Tema: rojo institucional Univalle, tipografía sobria, logo en esquina, pie con numeración X/N. Referencia visual: las presentaciones de José y Nicolás.
- Layouts custom: `cover` (portada), `section-divider` (índice con sección activa resaltada, patrón José), `two-cols-figure` (bullets izquierda + figura derecha, el patrón dominante), `grid-2x2` (slide 5 del problema).
- Componentes: `<EmphasisBox>` (caja de énfasis, patrón Nicolás), `<ObjectiveTag letter="A">` (etiquetas del hilo conductor), `<BackupBadge>` (rótulo "Diapositiva de apoyo").
- **Congelar el contrato**: documentar en un comentario o README corto qué layouts/componentes existen y cuándo usarlos. Esto es lo que hace viable cualquier paralelismo posterior.
- Validar con 3 slides de muestra reales (portada, una de desarrollo con figura, una de resultados) exportadas a PDF.
- ✅ Checkpoint: revisión humana del look — **no avanzar hasta aprobar el tema.**

**Fase 2 — Contenido por bloques (secuencial recomendado; paralelizable)**
- Escribir los bloques en orden (0 → 8), un archivo por bloque, siguiendo las tablas de este plan (cada fila ya especifica contenido visual y puntos clave).
- Revisar el render de cada bloque antes de pasar al siguiente (checkpoint ligero, ~2 min): es donde se detecta el patrón de desborde/densidad a tiempo.
- *Variante paralela (opcional):* un subagente por bloque, cada prompt con (a) el contrato de la Fase 1, (b) las filas del plan de su bloque, (c) 1 slide de ejemplo ya aprobada como referencia de densidad. Después, **una pasada de consolidación en un solo contexto** para homogeneizar tono y densidad.
- La **slide 13 (diagrama de arquitectura global)** se deja como placeholder en esta fase y se trabaja aparte: primero intento con Mermaid embebido; si el layout no da la talla, SVG/draw.io exportado a `public/figures/`.
- ✅ Checkpoint por bloque: render sin desbordes, figuras legibles.

**Fase 3 — Diagrama de arquitectura + demo (secuencial, iterativo con humano)**
- Iterar la slide 13 hasta que se lea en 5 segundos: zonas coloreadas por proveedor (Firebase vs AWS), flujo Cliente → BFF → API Gateway → Lambdas → Firestore/SQS/SNS/CloudWatch.
- Definir formato de la slide 27 (DEMO limpia vs cajas "Video sugerido") y, si aplica, grabar/insertar los videos.
- ✅ Checkpoint: el diagrama aprobado por ti (nadie más conoce la arquitectura real).

**Fase 4 — QA visual y notas (paralelizable en la revisión)**
- `slidev export --format png` → revisar las 34 imágenes: desbordes, contraste, tamaño de capturas, consistencia de densidad. *Aquí sí: subagentes en paralelo (uno por bloque) leyendo los PNG y reportando defectos.*
- Añadir notas del presentador (`<!-- notas -->`) con el tiempo por slide del plan (§3) — visibles solo en modo presentador.
- Ensayo con `slidev --remote` o modo presentador; ajustar tiempos reales.
- Export final a PDF (plan B por si falla el equipo el día de la sustentación).
- ✅ Checkpoint final: PDF completo + ensayo cronometrado ≤ 25 min.

### Resumen operativo

| Fase | Modo | Subagentes | Checkpoint humano |
|------|------|-----------|-------------------|
| 0. Scaffold | Secuencial | No | Deck vacío exporta |
| 1. Tema + componentes | Secuencial | No | **Aprobar look (bloqueante)** |
| 2. Contenido por bloques | Secuencial (paralelo opcional) | Opcional, 1 por bloque + consolidación | Render por bloque |
| 3. Diagrama arquitectura + demo | Secuencial | No | Aprobar diagrama |
| 4. QA visual + notas | Paralelo en revisión | Sí, lectura de PNGs | Ensayo cronometrado |
