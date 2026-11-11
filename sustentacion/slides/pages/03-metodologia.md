---
layout: section-divider
current: 3
sections:
  - Contexto y problema
  - Objetivos y alcance
  - Metodología
  - Desarrollo
  - Demo
  - Resultados
  - Conclusiones y trabajo futuro
---

<!--
Slide 12 — Separador del Bloque 3: Metodología (~6 s; el bloque es una sola slide, ~1 min).

═══ GUION ═══

-->

---
layout: two-cols-figure
columns: 1.15fr 1fr
figureHeight: 7.5rem
---

# Metodología y gestión del trabajo

::left::

- Investigación **aplicada de base tecnológica**, *in vivo*: se interviene una organización real — madurez **TRL 7–9** (Colciencias)
- Estrategia de **Chavarriaga y Arboleda**: investigación y desarrollo inicial → investigación aplicada → transferencia
- **SCRUM** con iteraciones semanales, complementado con **pair programming** (XP) y cultura **DevOps / CI-CD**
- Backlog priorizado con **Product Owner** y **Tech Lead** sobre un Kanban en **Plane** (*open source*, autoalojado)
- **Meet** para sprint planning · **Discord** para pair programming · **Telegram** para comunicación asíncrona

::figure::

![Estrategia de investigación de Chavarriaga y Arboleda](/figures/estrategia-chavarriaga-arboleda.png)

![Tablero Kanban del proyecto en Plane](/figures/plane-kanban-board.png)

*La estrategia de investigación (fuente: LIDIS) y el backlog real del proyecto en Plane*

<!--
Slide 13 — Metodología y gestión del trabajo (~60 s).

═══ GUION (leer casi literal) ═══

"Metodológicamente, este es un trabajo de investigación aplicada de base tecnológica, hecho
in vivo: se interviene una organización real, con un nivel de madurez TRL 7 a 9 en la escala
de Colciencias, es decir, demostración, validación y despliegue en entorno real.

Sigue la estrategia de Chavarriaga y Arboleda, que está a la derecha, en tres momentos:
investigación y desarrollo inicial —el diagnóstico y las pruebas de concepto—, investigación
aplicada —la intervención sobre la plataforma— y transferencia —la documentación en la empresa
y este informe.

En el día a día, el trabajo se organizó con SCRUM en iteraciones semanales, complementado con
pair programming como práctica de XP y con cultura DevOps de integración y despliegue continuos.
El backlog se priorizó con el Product Owner y el Tech Lead sobre un Kanban en Plane, que es la
segunda imagen: el tablero real del proyecto.

Y la comunicación fue Meet para las planeaciones, Discord para el pair programming y Telegram
para lo asíncrono — recuerden ese canal de Telegram, porque va a reaparecer más adelante
recibiendo alertas de producción."

═══ NOTAS ═══
Si preguntan por qué SCRUM y no XP o FDD: slide de apoyo "Comparativa de metodologías
ágiles", con la tabla multicriterio completa.

TRL 7 A 9 — qué es y por qué el trabajo se sitúa ahí (si lo preguntan, 30 s):
La escala TRL (Technology Readiness Level) mide la madurez de una tecnología en nueve
niveles, de la idea básica (1) a la operación real (9). Colciencias/Minciencias la adopta
para clasificar la investigación aplicada. Los tres niveles altos son:
  TRL 7 — prototipo demostrado en ENTORNO OPERACIONAL real (no en laboratorio).
  TRL 8 — sistema completo, probado y calificado para operar.
  TRL 9 — sistema real, en operación y validado con usuarios en producción.
Por qué el trabajo se sitúa en ese rango: no hay prototipo ni laboratorio — se interviene
Paralegales EN PRODUCCIÓN, con usuarios reales, y cada cambio se despliega y se valida en
el entorno operacional. Ese es exactamente el argumento del "in vivo": el rango TRL no es
un adorno, es la razón por la que quedan descartadas las reescrituras y las migraciones
totales, y la que obliga a la evolución incremental.
Si preguntan por qué un RANGO y no un nivel único: el trabajo atraviesa los tres —
demostración en staging (7), calificación mediante las compuertas del CI (8) y despliegue
validado en producción (9).

Mapeo del modelo Chavarriaga-Arboleda al proyecto (si piden explicarlo, 30 s):
1) Investigación y desarrollo inicial = diagnóstico de los 4 frentes, estado del arte,
   pruebas de concepto (incluida la migración a DynamoDB, probada y descartada).
2) Investigación aplicada = la intervención sobre la plataforma en producción.
3) Transferencia = documentación en la empresa, el informe y la replicabilidad del enfoque.

OJO: NO mencionar TDD — no se implementó durante el TG. Si el jurado lo cita (el informe
lo lista como práctica XP complementaria "cuando resultara pertinente"): aclarar que la
práctica XP adoptada fue pair programming, y que las pruebas automatizadas del trabajo
(suite de reglas) se escribieron como verificación, no como desarrollo guiado por pruebas.

El canal de Telegram del equipo reaparece en la slide "Observabilidad transversal" (21)
recibiendo alertas de producción: si mencionas Telegram aquí, deja sembrado el callback.
-->
