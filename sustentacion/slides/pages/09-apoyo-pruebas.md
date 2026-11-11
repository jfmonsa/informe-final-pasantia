---
---

# Estrategia de pruebas guiada por riesgo

<BackupBadge />

| Mecanismo | Momento | Automatización |
|---|---|---|
| Análisis estático y formato (ESLint, Prettier) | Pre-commit y PR | Compuerta automática |
| Convenciones del historial (Commitlint) | Commit-msg | Compuerta automática |
| Reglas de seguridad de Firestore (16 casos) | Local y PR | Compuerta automática |
| Control del flujo de ramas | Pull request | Compuerta automática |
| Pruebas unitarias Go (línea base del equipo) | Local | Automatizado, no en CI |
| Base E2E con Playwright | Local | Sin integrar |
| Flujos funcionales extremo a extremo | Antes de producción | Manual sistemático |
| Observabilidad y alertas | Posdespliegue | Automatizado |

<EmphasisBox title="Criterio">
Automatización obligatoria donde el riesgo es de seguridad; detección temprana donde el riesgo es funcional.
</EmphasisBox>

<!--
Diapositiva de apoyo — EL ESCUDO de la pregunta "¿dónde están sus pruebas automatizadas?".
El bloque de Pruebas ya no existe en el guion (la slide "SDLC y calidad continua" lo
absorbió): estas dos slides se conservan como apoyo para la ronda de preguntas.
Ver defensa.md, ataques #9, #10 y #11.

Respuesta de 20 s si la piden: "El aseguramiento de calidad del trabajo es de PROCESO
— SQA en el sentido de IEEE 730: hooks, validación de commits, lint diferencial y CI
obligatorio. Son ocho mecanismos a lo largo del ciclo de vida, cuatro de ellos compuertas
capaces de interrumpir la integración. Las pruebas automatizadas se concentraron donde el
riesgo lo exige: la suite de reglas de seguridad de Firestore — máximo impacto de fallo,
mínima volatilidad del código. El resto se cubre con validación manual sistemática en
staging y detección temprana vía observabilidad; las limitaciones y el trabajo futuro
están declarados en el informe como decisión de costo-beneficio, no como omisión."

NO decir "QA" a secas. NO afirmar que existe una suite E2E operativa.
-->

---
layout: two-cols-figure
---

# Evidencia de pruebas

<BackupBadge />

::left::

- **16 casos** sobre las reglas de Firestore: Vitest + Firebase Emulator Suite
- Matchers propios `toAllow` / `toDeny`; predominan los **casos negativos** (acceso indebido bloqueado)
- La suite verifica el **mismo `firestore.rules` que se despliega** y es compuerta del CI
- Validación manual sistemática en *staging*: casos **CP-01…CP-06** documentados
- Base E2E con Playwright (POM + fixtures) **fuera del CI**: decisión documentada de costo-beneficio

::figure::

![Corrida de la suite de reglas de seguridad](/figures/pruebas-rules-run.png)

*Ejecución de la suite de reglas de Firestore sobre la Emulator Suite*

<!--
Diapositiva de apoyo — la evidencia dura que respalda la slide anterior.
Delimitación que debes decir TÚ antes de que la pregunten: las E2E existen como base
exploratoria pero NO son compuerta (intermitencia + costo de mantenimiento en equipo
reducido). Los CP-01…CP-06 corren sobre stage.paralegales.co, réplica de producción.
Ver defensa.md, ataque #12 (trampas de terminología).
-->
