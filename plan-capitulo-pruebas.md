# Plan — Capítulo "Pruebas del Sistema"

> Anteproyecto / informe de práctica profesional — Proyecto Paralegales
> Autor: jfmonsa · Fecha de planeación: 2026-05-30

## 1. Decisión estructural

**Capítulo dedicado (no fusionar con Resultados).** Razones:

1. Los capítulos ya escritos hacen *forward-reference* explícita a "el capítulo
   dedicado a las pruebas del sistema":
   - `7.7-sdlc-aseguramiento-calidad.tex` (estrategia de pruebas automatizadas).
   - `8.1-enfoque-evaluacion.tex` y `8.5-objetivo-d-calidad.tex` (delegan el
     detalle de validación automatizada).
2. Hay material real suficiente para un capítulo coherente sin relleno.
3. Separación de roles coherente con la metodología (investigación aplicada de
   base tecnológica, TRL 7–9):
   - Cap. 7 → *cómo se construyó*.
   - Cap. Pruebas → *cómo se valida sistemáticamente*.
   - Cap. Resultados → *qué resultados produjo, con evidencia demostrativa*.

**Ubicación:** entre el cap. 7 (Desarrollo) y el cap. 8 (Resultados), de modo que
Resultados quede como capítulo de cierre con su síntesis objetivo-por-objetivo.
Es trivial moverlo (una línea `\include` en `anteproyecto-jfmonsa.tex`).

## 2. Restricción del usuario

- **NO incluir las pruebas unitarias del backend Go (`paralegales-services`).**
  El capítulo se concentra en: reglas de seguridad de Firestore (automatizadas),
  validación manual sistemática en *staging*, y la evaluación exploratoria de
  e2e con Playwright.

## 3. Alcance — qué entra (IN SCOPE)

- **Enfoque y estrategia de pruebas** (multicapa, demostrativa, no experimental).
- **Pruebas unitarias de las reglas de seguridad de Firestore**
  (Vitest + `@firebase/rules-unit-testing` + Firebase Emulator Suite):
  - Arquitectura de la suite: `setupFirestoreTestEnvironment` /
    `clearFirestoreTestEnvironment`, *custom matchers* `toAllow`/`toDeny`,
    contextos autenticado/no autenticado, siembra de datos con reglas
    deshabilitadas.
  - Cobertura por colección: `users`, `payments`, `associations`, reglas básicas.
  - Diseño de casos **positivos y negativos** (propietario vs. no propietario,
    datos válidos vs. inválidos, autenticado vs. anónimo).
  - Comando `test:rules` sobre el emulador (`firebase emulators:exec`).
- **Validación manual sistemática en *staging*** (`stage.paralegales.co`):
  formaliza la práctica informal como metodología (rol de *stage*, flujos
  críticos, criterios de aceptación, tabla de casos representativos).
- **Evaluación exploratoria de e2e (Playwright):** se montó POM/fixtures para
  auth, no se consolidó; justificación de ingeniería (honestidad).
- **Integración en CI (estado real):** el job existe pero `test:rules` está
  *comentado* en `ci.yml` (TODO) → se ejecuta local/bajo demanda; la
  automatización en CI se declara como trabajo futuro.
- **Síntesis y limitaciones.**

## 4. Qué NO entra (OUT OF SCOPE / honestidad)

- Pruebas unitarias de Go (excluidas por decisión del usuario).
- No afirmar e2e automatizado consolidado.
- No presentar lo manual como automatizado.
- No reportar métricas de cobertura (%) que no se generen realmente.
- No duplicar el detalle de Lefthook/CI ya descrito en 7.7 (solo referenciar).
- No afirmar que las reglas corren en CI (hoy están comentadas).

## 5. Estructura propuesta (subsecciones)

| # | Subsección | Contenido | Evidencia |
|---|------------|-----------|-----------|
| X.1 | Enfoque y estrategia de pruebas | Pirámide adaptada, evidencia demostrativa | — |
| X.2 | Pruebas unitarias de reglas de seguridad de Firestore | Suite, emulador, matchers, casos +/− | salida `test:rules`, caso negativo |
| X.3 | Validación manual sistemática en *staging* | Metodología, flujos, criterios | tabla de casos + capturas |
| X.4 | Evaluación exploratoria de e2e (Playwright) | Qué se montó y por qué no se consolidó | — |
| X.5 | Integración en el pipeline de CI | Estado real (gate parcial) | referencia a 8.5 |
| X.6 | Síntesis y limitaciones | Cobertura por capa, trabajo futuro | — |

## 6. Coherencia con capítulos existentes (evitar solapamiento)

- **7.7**: recortar el detalle fino de "estrategia de pruebas automatizadas"
  (queda como puntero a este capítulo). *Pendiente, opcional.*
- **8.1 / 8.5**: mantienen sus frases de delegación; este capítulo aporta el
  detalle prometido.

## 7. Convenciones de redacción a respetar

- `\section{Pruebas del Sistema}` en el archivo principal; `\subsection` por
  apartado, con `\label{subsec:...}`.
- Patrón de figuras: `\newcommand\<algo>Caption{...}` + `\begin{figure}[H]` +
  `\caption[\<algo>Caption]{\<algo>Caption Fuente: Elaboración propia.}`.
- Numeración de figuras a partir de **fig40** (la última usada es fig39).
- Cruces con `\autoref{subsec:sdlc}` y `\autoref{subsec:resultado-d}`.
- Términos en inglés en `\textit{...}`; comandos en `\texttt{...}`.

## 8. Archivos a crear

- `sections/8-pruebas-del-sistema.tex` (archivo principal del capítulo).
- `sections/8-pruebas-del-sistema-sub-sections/8.1-enfoque.tex`
- `.../8.2-reglas-seguridad-firestore.tex`
- `.../8.3-validacion-manual-staging.tex`
- `.../8.4-evaluacion-e2e.tex`
- `.../8.5-integracion-ci.tex`
- `.../8.6-sintesis-limitaciones.tex`
- Insertar `\include` en `anteproyecto-jfmonsa.tex` antes de `8-resultados`.

## 9. Checklist pendiente (para el autor)

- [ ] Recuperar/recrear 6–10 casos de prueba manuales reales sobre *stage* para
      la tabla de X.3.
- [ ] Capturas: salida de `test:rules`, caso negativo de regla, casos manuales.
- [ ] Confirmar con el director si admite el capítulo extra antes de Resultados.
- [ ] (Opcional) Recortar 7.7 para que no duplique X.2.
