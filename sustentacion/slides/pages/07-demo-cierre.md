---
layout: section-divider
current: 7
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
Slide 31 — Separador del Bloque 7: Conclusiones y trabajo futuro (~8 s; el bloque, ~2.5 min).

═══ GUION (leer casi literal) ═══

"Para cerrar: las conclusiones y el trabajo futuro."

═══ NOTAS ═══

Separador corto a propósito: el jurado ya sabe que viene el final y lo que importa es
llegar con tiempo a la slide 32, que es la que carga el cierre argumental.
Bajar medio tono y frenar el ritmo aquí: las conclusiones se dicen más despacio que los
resultados. Es el último tramo en el que hablas sin interrupción.
-->

---

# Conclusiones

- Objetivo general **cumplido sin disrumpir producción**: esa restricción definió la estrategia de evolución incremental
- Las **4 líneas de intervención (A–D)** contribuyeron, cada una, a la maduración técnica de la plataforma
- Aseguramiento **deliberadamente asimétrico** y con límites reconocidos: automatización donde el riesgo es de seguridad, detección en producción donde es funcional
- Paralegales es un **programa de tipo E** (Lehman): la refactorización fue la *condición* para seguir desarrollando features, no su competencia

<EmphasisBox title="Reflexión">
No fue una liquidación de la deuda técnica, sino un pago selectivo de sus partidas de mayor interés (Kruchten) — y la deuda que se conserva quedó visible mediante telemetría.
</EmphasisBox>

<!--
Slide 32 — Conclusiones (~80 s).

═══ GUION (leer casi literal; ritmo lento, mirar a cámara entre puntos) ═══

"El trabajo partió de una pregunta: cómo evolucionar la arquitectura de una plataforma en
producción sin disrumpir el servicio y sin incurrir en el costo y el riesgo de una migración
total de proveedor. Esa pregunta se desagregó en cuatro objetivos, y estos son los cierres.

1 el objetivo general se cumplió sin disrumpir producción.

2. Segundo: las cuatro líneas de intervención contribuyeron, cada una, a la maduración técnica
de la plataforma. Y son complementarias entre si

3. Paralegales es un programa de tipo E segun la teoria de evolución del software de Lehman — un sistema embebido en el mundo real, que debe cambiar continuamente. En esa clave, la refactorización no compite con el desarrollo de
nuevas funcionalidades: es la condición para poder seguir haciéndolas.

═══ NOTAS ═══

Cerrar uno a uno: pregunta → objetivos → conclusión.
Terminología: "líneas de intervención" para A–D; "frentes" queda reservado para los
cuatro PROBLEMAS de la slide 6 — no mezclar los dos términos (ver defensa.md, ataque #1).
La reflexión de ingeniería (Lehman + Kruchten) eleva el cierre por encima del "se hizo todo".

El bullet 2 hablado añade algo que NO está impreso —por qué las cuatro líneas son
complementarias y no una lista— y es el argumento que convierte A–D en una arquitectura y
no en cuatro tareas sueltas. No omitirlo por tiempo.

Si preguntan por Lehman: la clasificación S/P/E distingue programas especificados
formalmente (S), los que resuelven un problema del mundo real con una solución aproximada
(P) y los embebidos en el mundo real, que lo modifican y son modificados por él (E). Los
tipo E están sujetos a la ley de cambio continuo y a la de complejidad creciente: sin
trabajo deliberado de estructura, la complejidad aumenta y la mantenibilidad decae. Ese es
el respaldo teórico de por qué esta intervención era necesaria y no cosmética.
Si preguntan por Kruchten: la metáfora de la deuda técnica con principal e intereses —
el interés es el sobrecosto que se paga en CADA cambio mientras la deuda siga ahí; por eso
se priorizan las partidas de mayor interés, no las de mayor principal.
-->

---

# Trabajo futuro

- Integrar la **suite Go existente al CI** del repositorio de servicios: compuerta sin escribir casos nuevos
- Ampliar el **testing automatizado**: pruebas **unitarias, de integración y E2E**
- Publicar **cobertura** con umbral mínimo que impida su degradación
- Declarar **SLOs y error budgets** con el historial que los SLIs ya acumulan — y un registro de incidentes para medir **MTTR**

<EmphasisBox title="Cierre">
La plataforma queda con menor exposición de su lógica crítica, mayor trazabilidad operativa y mejor mantenibilidad — preparada para seguir evolucionando sin detenerse.
</EmphasisBox>

<!--
Slide 33 — Trabajo futuro (~45 s).

═══ GUION (leer casi literal) ═══

"El trabajo futuro sale directamente de las limitaciones declaradas en el informe, y está
ordenado por relación esfuerzo-garantía.

Lo primero, que es lo más barato: integrar al pipeline de integración continua la suite de
pruebas en Go que ya existe en el repositorio de servicios. Es una compuerta más sin
escribir un solo caso nuevo.

Segundo, ampliar el testing automatizado en los tres niveles: unitario, de integración y de
extremo a extremo.

Tercero, publicar la cobertura con un umbral mínimo que impida su degradación con el tiempo.

Y cuarto, declarar los SLOs y los error budgets con el historial que los indicadores ya
están acumulando, junto con un registro de incidentes que permita medir el tiempo medio de
recuperación."

═══ NOTAS ═══

Traza = recorrido de una petición
Correlation ID = mismo identificador para seguir una petición entre servicios
SLO = objetivo de calidad (server level objetive)
Error budget = margen permitido para no cumplir el SLO 
SLI = métrica que mide el servicio (server level indicator)
p95 = latencia del 95% de las peticiones
5xx = errores del servidor, señal de fallo operativo


Todas las líneas nacen de las limitaciones declaradas en el informe: costo acotado,
garantía alta. Ordenadas por relación esfuerzo/garantía — decirlo, porque justifica el orden
y muestra criterio, no una lista de deseos.

ENCADENAR con la slide 32: el trabajo futuro NO es una confesión de lo que faltó, es la
continuación natural de un aseguramiento asignado por riesgo. Si el tono se vuelve de
disculpa, el jurado lo lee como hueco.

OJO: no afirmar que existe una suite E2E — no la hay. Si el jurado cita la "base E2E con
Playwright" del informe (8.4 de pruebas): fue una base exploratoria mínima, no una suite
operativa; por eso ampliar el testing (unitario, integración, E2E) es trabajo futuro.

El punto 4 recoge la delimitación honesta de la slide 28 (sin SLOs por falta de historial):
si ya lo dijiste allá, aquí basta con "los SLOs que mencioné" y ahorras ~8 s.
-->

---
layout: center
---

# Gracias

**¿Preguntas?**

Juan Felipe Monsalve Vargas · Universidad del Valle, Sede Tuluá

<!--
Slide 34 — Gracias (~30 s).

═══ GUION (leer casi literal; despacio, mirando a la cámara, NO a las notas) ═══

"Con esto termino.

Gracias al jurado por su tiempo y por la lectura del informe. Al profesor Royer Estrada, por
la dirección del trabajo. Y al equipo de Webcloster y de Paralegales, por abrirme una
plataforma en producción y confiarme una intervención sobre ella.

Quedo atento a sus preguntas."

═══ ENTREGA ═══

- Esta es la única slide que conviene decir SIN leer: sostener la mirada en la cámara.
- Terminar y CALLARSE. No rellenar el silencio con "eso sería todo" ni con resúmenes: el
  turno pasa al jurado y el silencio es de ellos.
- Dejar la slide fija en pantalla durante toda la ronda: tiene tu nombre y la institución.
- Antes de responder cada pregunta: agradecerla en tres palabras y reformularla en una
  frase ("si entiendo bien, me pregunta por..."). Gana tiempo y evita responder otra cosa.
- Si no sabes algo: decir qué sí sabes, dónde está en el informe y hasta dónde llega lo que
  se puede afirmar. No improvisar cifras — las cifras defendibles son las de las slides 28 y 29.

═══ NOTAS ═══

Quedan 17 diapositivas de apoyo listas para la ronda de preguntas (archivos 08 a 11):
metodologías ágiles · marco teórico · por qué no migrar a AWS · estrategia y evidencia de
pruebas · por qué la observabilidad · vigilar RJU/SAMAI · gestión del trabajo · y las 9
slides de módulos del producto, que además sirven de índice de capítulos de la demo.

Mapa rápido de a dónde saltar según la pregunta:
- "¿por qué SCRUM y no XP/FDD?" → comparativa de metodologías ágiles (08).
- "¿por qué no migraron todo a AWS?" → ¿Por qué no migrar todo a AWS? (10).
- "¿y sus pruebas?" → estrategia de pruebas guiada por riesgo + evidencia de pruebas (09).
- "¿cómo saben si falla la Rama Judicial?" → vigilar RJU/SAMAI (10).
- detalle de un módulo del producto → la slide del módulo en 11-apoyo-features.md.
Tener defensa.md abierto en la segunda pantalla, no en la compartida.
-->
