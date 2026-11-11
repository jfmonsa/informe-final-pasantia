# Comparativa de metodologías ágiles

<BackupBadge />

| Criterio | SCRUM | XP | FDD |
|---|---|---|---|
| Orientación | Gestión iterativa por roles y eventos | Desarrollo técnico, calidad del código | Centrado en funcionalidades |
| Iteraciones | Sprints de 1–4 semanas | Muy cortas (≤ 1 semana) | Por funcionalidad |
| Control de calidad | Revisión de sprint, retrospectivas | TDD, CI, pair programming | Estructurado, menos pruebas |
| Tamaño de equipo | < 10 personas | Pequeño, muy colaborativo | Equipos grandes, roles definidos |
| Adecuación al proyecto | Buena para seguimiento y coordinación | Excelente enfoque técnico | Menos adecuado en reestructuración |

- Se eligió **SCRUM** (el equipo ya iteraba semanalmente) complementado con **pair programming**, práctica de **XP**

<!--
Diapositiva de apoyo — usar si preguntan por qué SCRUM y no XP/FDD (desde la slide 13).
Versión comprimida de la tabla comparativa multicriterio del informe.
-->

---

# Marco de referencia: conceptos clave

<BackupBadge />

| Concepto | Papel en este trabajo |
|---|---|
| Backend-for-Frontend (Newman) | Capa servidor dedicada al frontend; encapsula integraciones sensibles |
| Domain-Driven Design (Evans) | Bounded contexts → las 9 features como Nuxt Layers |
| Arquitectura hexagonal (puertos y adaptadores) | Repositorio por interfaz: persistencia sustituible |
| Strangler Fig (Fowler) | Evolución incremental sin reescritura ni parada del sistema |
| 3 pilares de la observabilidad | Logs, métricas y trazas correlacionadas con un mismo ID |
| Deuda técnica (Kruchten) | Pago selectivo de las partidas de mayor interés |
| Leyes de Lehman (tipo E) | La complejidad solo se contiene con trabajo deliberado |
| TRL (Colciencias) | Niveles 7–9: validación y despliegue en entorno real |

<!--
Diapositiva de apoyo — usar si preguntan por fundamentos teóricos.
Cada concepto está anclado a una decisión concreta del proyecto.
-->

---

# ¿Por qué no migrar todo a AWS?

<BackupBadge />

- La migración **Firestore → DynamoDB se inició y se descartó**: decisión de producto tras evaluar costo-beneficio
- **Firebase Auth y Firestore satisfacen** los requerimientos no funcionales de la etapa actual
- Una migración total implica **costo, riesgo de interrupción** y disrupción organizacional injustificados
- El **repositorio por interfaz se conservó**: deja abierta la migración futura por componentes
- El valor está en **reconfigurar las relaciones** entre subsistemas, no en sustituir el sustrato

<EmphasisBox title="Respuesta corta">
No era el objetivo: la evaluación empírica mostró que el costo y el riesgo superaban el beneficio, y la arquitectura deja la puerta abierta para migrar por partes cuando se justifique.
</EmphasisBox>

<!--
Diapositiva de apoyo — la pregunta más probable del jurado (anticipada en las slides 7 y 11).
El dato fuerte: la migración no se especuló, se INTENTÓ y se descartó con evidencia.
-->
