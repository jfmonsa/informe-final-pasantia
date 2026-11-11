---
layout: section-divider
current: 2
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
Slide 8 — Separador del Bloque 2: Objetivos y alcance (~8 s; el bloque completo, ~2.5 min).

═══ GUION ═══

"Con el problema ya planteado, siguen los objetivos y el alcance
-->

---

# Objetivo general

> **Evolucionar la arquitectura de la plataforma Paralegales hacia un diseño híbrido Firebase y AWS que reubique la lógica de negocio crítica fuera del cliente, refactorice la organización interna de sus componentes y consolide capacidades transversales de observabilidad y aseguramiento de calidad, sin disrumpir la operación del servicio en producción.**

<!--
Slide 9 — Objetivo general (~50 s, incluida la lectura).
-->

---

# Objetivos específicos: el hilo conductor

- **A — Lógica al servidor:** reubicar la lógica de negocio crítica del cliente hacia el lado del servidor, reduciendo la superficie de exposición
- **B — Modularización:** refactorizar frontend y backend con patrones modulares que aíslen responsabilidades y reduzcan el acoplamiento
- **C — Observabilidad + IaC:** implementar observabilidad estructurada transversal, con infraestructura como código y notificaciones proactivas
- **D — Calidad continua:** consolidar prácticas de aseguramiento de calidad a lo largo del ciclo de vida del desarrollo

<EmphasisBox title="Hilo conductor">
Estas cuatro letras etiquetan las slides de desarrollo y de resultados: cada objetivo se verá diseñado, construido y evidenciado.
</EmphasisBox>

<!--
Slide 10 — Objetivos específicos (~65 s).

═══ GUION (leer casi literal) ═══

"Ese objetivo general se desagrega en cuatro objetivos específicos, que son las cuatro líneas
de intervención con las que se atienden los frentes ya expuestos.

El objetivo A, lógica al servidor: reubicar la lógica de negocio crítica del cliente hacia el
lado del servidor, reduciendo la superficie de exposición.

El objetivo B, modularización: refactorizar frontend y backend con patrones modulares que
aíslen responsabilidades y reduzcan el acoplamiento.

El objetivo C, observabilidad con infraestructura como código: implementar observabilidad
estructurada transversal, con notificaciones proactivas al equipo.

Y el objetivo D, calidad continua: consolidar prácticas automatizadas de aseguramiento de
calidad a lo largo del ciclo de vida del desarrollo."
-->

---

# Alcance y exclusiones

| Dentro del alcance | Fuera del alcance |
|---|---|
| Las **4 líneas de intervención** (A–D) sobre la plataforma en producción | Sustituir **Firebase Authentication** por otro proveedor de identidad |
| Aplicadas a los módulos activos: **dashboard, autenticación, procesos judiciales y campañas** | Migrar **Firestore** a otro motor (DynamoDB: evaluada y descartada) |
| Infraestructura como código para la observabilidad | Transición a un entorno **100 % AWS** |

<!--
Slide 11 — Alcance y exclusiones (~60 s).

--  mencionar 4 objetivos

═══ GUION (leer casi literal) ═══

"
creo que ya lo habran notado que se menciona todo el rato "no hacer una migración total de provedores de nube" y "AWS y Firebase"
esto se debe a que en que durante la etapa lectiva en que se construye el anteproyecto se elaboro en base al objetivo de realizar una migración total de Firebase y AWS
esto en su momento fue plateado como una necesidad por parte de la empresa, pero despues de haber finalizado este proceso, la empresa decide que es más prioritario y generaba más valor el desarrollo de nuevas
funcionalidades que el costo tecnico que supondría una migración total de proveedores de nube
-->
