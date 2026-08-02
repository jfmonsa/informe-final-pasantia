las siguientes son las correcciones que hizo el evaluador del trabajo de grado los cuales (ver los pantallazos).

> **Nota de estado.** Este archivo fue actualizado tras una auditoría de las siete
> observaciones contra el código fuente del informe y los repositorios
> `paralegales-ui` y `paralegales-services`. Varias afirmaciones de la versión
> anterior resultaron falsas o parciales y se corrigieron aquí. El plan de
> remediación derivado está en `correcciones/plan-remediacion.md`; las tareas T1 a
> T7 de ese plan ya están aplicadas al árbol de trabajo, y T8 y T9 siguen
> pendientes de decisión del autor.

1. ✅ RESUELTO — resumen acortado a un párrafo, palabras clave reducidas a 5 y se añadió el *Abstract* en inglés (`sections/0.1-resumen.tex`). **Commit:** `53902d9`. **Ajuste posterior (T5):** al podar de 8 a 5 palabras clave se había eliminado «Aseguramiento de calidad», que es la mitad del título del trabajo; se repuso sustituyendo `Domain-Driven Design` (técnica subordinada al objetivo B) y se aplicó el cambio simétrico en `Keywords` (`Software quality assurance`). Siguen siendo cinco.
![alt text](image.png)

   > **Transcripción:** «EL RESUMEN ESTA MUY LARGO Y HAY MUCHAS PALABRAS CLAVE. AÑADAN EL ABSTRACT TAMBIEN»

2. ✅ RESUELTO — se eliminaron los ~55 incisos delimitados por raya (—) en todo el documento, reescritos con comas, paréntesis, dos puntos o división de oraciones. Solo se conservaron los guiones ortográficos de compuestos y el nombre del patrón `Handler--Service--Repository`. **Commit:** `45e311e`. **Ajuste posterior (T4):** quedaba una ocurrencia de ` -- ` con espacios en `7.2-arquitectura.tex`, que LaTeX componía como raya y además introducía un segundo nombre para el patrón (`Handler -- Service Struct -- Abstract Repository`); se unificó a `Handler--Service--Repository`, que es como lo llama el resto del documento en ocho lugares. Verificado: `grep -rn -- "Handler -- Service" sections/` sale vacío y no hay rayas en ningún `.tex`.
![alt text](image-1.png)

   > **Transcripción:** «en el documento se redacta mucho con guiones " - " eso no es una escritura natural para nosotros, y suele ser usado por la IA, revisen la escritura de todo el documento»

3. ✅ RESUELTO — el marco teórico pasó de 1 a 3 subsecciones: se añadieron "Leyes de la evolución del software" (Lehman) y "Teoría de la deuda técnica" (Cunningham, Kruchten et al.), con 2 referencias nuevas en `bibliografia.bib`. **Commits:** `9ac3927` (añade 4 subsecciones y 6 referencias) y `87acf64` (elimina la subsección de modularidad y sus 4 citas). **Ajuste posterior (T6):** `Lehman1980` y `Kruchten2012` se citaban únicamente dentro de `4.2-marco-teorico.tex` y no aparecían ni una vez en los capítulos 7, 8 y 9, de modo que el marco añadido no gobernaba el resto del documento. Se añadieron dos invocaciones breves, reutilizando el vocabulario ya establecido en 4.2: una en `8.3-objetivo-b-arquitectura.tex` (el resultado del objetivo B como pago de la partida de deuda de mayor interés, deuda estructuralmente invisible) y otra en `9-conclusiones.tex` (Paralegales como programa de tipo E, la refactorización como el trabajo deliberado que exige la ley de complejidad creciente, y el resultado como pago selectivo con la porción restante hecha visible por telemetría).
![alt text](image-2.png)

   > **Transcripción:** «MARCO TEORICO DE UNA SOLA SECCION?»

4. ⚠️ **PENDIENTE ASUMIDO.** No se hizo ninguna mejora de los pantallazos y no se hará: el autor decidió que ningún archivo de `img/` se modifica, reemplaza, recorta ni regenera, de modo que la observación queda deliberadamente sin atender. **Riesgo asumido:** el jurado pidió revisar *todos* los pantallazos y va a comprobar si se revisaron; conviene tener preparada una respuesta oral que reconozca la limitación en lugar de presentarla como resuelta. Este ítem es también la razón por la que el ítem 5 no puede cerrarse (la redacción de datos personales exige editar las capturas) y por la que la Figura 35 seguirá mostrando corridas de CI de 1m 22s a 1m 33s, tiempos que no incluyen el aprovisionamiento del emulador de Firebase.
![alt text](image-3.png)

   > **Transcripción:** «LOS PANTALLAZOS SE PUEDEN MEJORAR, REVISARLOS TODOS»

5. ❌ **NO RESUELTO.** La versión anterior de este archivo lo declaraba «RESUELTO (parcial)», lo que no corresponde al estado del PDF compilado, y se contradecía a sí misma al declarar la Fig 10 como PENDIENTE mientras acreditaba `753d01c` como resuelta para esa misma figura.

   **Lo que efectivamente se hizo:** `ca0bd0c` aplicó rectángulos negros en 10 figuras (nombres de partes de procesos judiciales, correos de terceros, alias y nombres del equipo, avatares con rostro real, `user_uid`/`payment_id`, y un token `oobCode` junto con la `apiKey` de Firebase), y se conservaron a propósito radicados (registro público), entidades, juzgados y los `correlation-id`.

   **Lo que retrocedió:** `cde89da` **revirtió** la redacción de la Figura 3 (`fig9-webdesk-kaban-board.png`), de modo que el tablero WebDesk vuelve a mostrar el nombre completo de un tercero (~15 veces), avatares con rostro real y el correo del autor. `753d01c` tapó dos de los cinco correos de la Figura 10 y dejó visible el institucional.

   **Exposición que sigue presente en el PDF (verificada):**

   | Figura | Archivo | Expuesto |
   |---|---|---|
   | 3 | `fig9-webdesk-kaban-board.png` | Nombre completo de un tercero ×15, rostros reales, correo del autor |
   | 6 | `fig14-api-gateway.png` | Cuenta AWS `062141952574` + `AdministratorAccess/juan.felipe.monsalve` |
   | 10 | `fig17-sso-google.png` | Nombre completo + `…@correounivalle.edu.co` + rostro real |
   | 13 | `fig21-update-email-password-feature.png` | `jfmonsalveva@gmail.com` en claro |
   | 27, 28 | `fig33-…`, `fig34-…` | Cuenta AWS + principal IAM |

   **Por qué no se puede cerrar:** redactar estas capturas exige editar archivos de `img/`, y el autor decidió que ninguna imagen se toca. La única mitigación disponible sin tocar imágenes es retirar del `.tex` el entorno `figure` de las figuras más comprometidas (candidata principal: la Figura 3, que expone datos de un tercero identificable y es la de menor valor argumental) y reescribir el párrafo que la referencia; eso cambia contenido del informe y renumera las figuras posteriores, así que **requiere decisión expresa del autor** (T9 del plan de remediación, no ejecutada).

   **Corrección de dato:** el conteo «las 34 figuras usadas» es incorrecto; el `.lof` lista **35** figuras numeradas.

   **Acción de mayor impacto, pendiente y ajena al informe:** el repositorio `jfmonsa/trabajo-de-grado` es **público** (`gh repo view` → `"visibility":"PUBLIC"`) y las imágenes sin redactar siguen en el historial de git (commit `2402149`). Mientras siga público, el nombre del tercero, los rostros, los correos y el ID de cuenta AWS con `AdministratorAccess` son recuperables aunque el PDF quedara limpio. Pasarlo a privado no requiere tocar ninguna imagen.

   **Commits:** `ca0bd0c` (redacción de las 10 figuras), `753d01c` (dos de cinco correos en Fig 10) y `cde89da` (reversión sin redactar del tablero WebDesk).
![alt text](image-4.png)

   > **Transcripción:** «en graficas como esta, o la 33, intuyo que se muestran datos con usuarios reales. Tener cuidado con los datos personales de la gente, sobre todo por cuidar a la empresa, revisen esto»

6. ✅ RESUELTO, pero **no de la forma que decía la versión anterior de este archivo**. El reencuadre de `1cf7fa2` es válido y se conserva: se definió «aseguramiento de calidad» como proceso según IEEE 730 e ISO/IEC 25010 en el marco conceptual; el capítulo se reencuadró en ocho mecanismos a lo largo del ciclo de vida (con tabla matriz de momento y grado de automatización) en lugar de una sola capa de pruebas; se corrigió la afirmación falsa de que el *backend* carece de pruebas, atribuyendo la línea base en Go al equipo; los E2E pasaron de «no consolidados» a «implementados, no integrados»; y las conclusiones integran la observabilidad como control de calidad posdespliegue. **Commit:** `1cf7fa2`.

   **Lo que era falso:** la afirmación de que «se activaron en el CI de `paralegales-ui` los pasos de pruebas que estaban comentados, de modo que la afirmación del informe sobre la compuerta obligatoria pasa a ser cierta». Verificado en `paralegales-ui`: en `stage` y `origin/stage` los tres pasos (caché del emulador, instalación de `firebase-tools` y `pnpm run test:rules`) siguen comentados en `.github/workflows/ci.yml`, y en `main` no existen. La activación solo vive como modificación **sin commitear** en el árbol de trabajo (`git status` → ` M .github/workflows/ci.yml`). La compuerta nunca ha corrido. A ello se suma que la Figura 35, que el informe presenta como evidencia del *pipeline*, muestra corridas de 1m 22s a 1m 33s, tiempos incompatibles con aprovisionar la Firebase Emulator Suite, y esa figura no se puede reemplazar.

   **Cómo se resolvió (T1):** se corrigió el texto en lugar de la infraestructura. El informe ahora dice lo que es cierto: la *suite* existe, tiene 16 casos, se ejecuta de forma local, automática y repetible sobre el emulador, y **su integración al *pipeline* queda como trabajo futuro**, encabezando esa lista por su relación esfuerzo/garantía (los pasos ya están redactados). La compuerta de validación estática diferencial sí opera y se conserva como tal, junto con el control del flujo de ramas. Archivos tocados: `8.5-integracion-ci.tex` (párrafo introductorio, segundo ítem del `enumerate` y párrafo de cierre), `8.1-enfoque.tex` (ítem «Compuertas de integración»), `8.6-sintesis-limitaciones.tex` (celdas de la tabla para «Reglas de seguridad de Firestore», recuento de mecanismos y apartado de trabajo futuro), `8.4-evaluacion-e2e.tex`, `8.5-objetivo-d-calidad.tex` y `9-conclusiones.tex` (ecos).

   **Recuento de la tabla de mecanismos, corregido en consecuencia:** de ocho mecanismos, **tres** actúan como compuertas automáticas capaces de bloquear la integración (análisis estático, Commitlint y control del flujo de ramas), **cuatro** se ejecutan automatizados sin operar como compuerta (reglas de Firestore, pruebas en Go, E2E y observabilidad) y **uno** es manual. Antes decía cuatro, tres y uno.

   **Si el autor quiere que la compuerta sea real,** basta con commitear y desplegar la activación de esos tres pasos en `paralegales-ui`; hecho eso, habría que revertir la parte de T1 que remite la integración al trabajo futuro. Mientras la Figura 35 no se pueda actualizar, la evidencia visual seguirá sin respaldar la afirmación, así que la redacción actual es la coherente.
![alt text](image-5.png)

   > **Transcripción:** «segun entiendo, la automatización se concentra solo en las reglas de seguridad de Firestore. Para un trabajo cuyo título incluye "aseguramiento de calidad" como eje central considero que se podria mejorar»

7. ✅ RESUELTO — se alineó lo que promete el marco teórico con lo que el trabajo reporta, sin inventar métricas. En el marco conceptual se delimitó qué se toma de SRE (instrumentación, SLI y alerta por umbral) y qué no (SLOs, error budgets, MTTR). En resultados se añadió la Tabla 5 con los cinco SLI realmente implementados (`RJURequestCount`, `RJU5xxCount`, `RJU4xxCount`, `RJULatencyMs`, `RJUStatusDistribution`) y las dos compuertas de alerta con sus umbrales verificados contra la plantilla de CloudFormation: más de 10 errores 5xx en 5 minutos y p95 sobre 5000 ms en 5 minutos. La ausencia de SLOs, error budgets y MTTR se declara como limitación con su causa (falta de periodo de observación y de registro de incidentes) y como trabajo futuro, con eco en las conclusiones. **Commit:** `c68e4c0`.
![alt text](image-6.png)

   > **Transcripción:** «Se menciona SRE y menciona explícitamente MTTR y error budgets en el marco teórico, porque no se reporta ningún dato con estos indicadores?»

---

## Hallazgos colaterales de la auditoría (no observados por el jurado)

Detectados al verificar los siete ítems anteriores y corregidos junto con ellos.

- **C1 (T2), referencia cruzada rota.** `8.3-objetivo-b-arquitectura.tex` prometía que «la verificación de ese desacoplamiento mediante pruebas unitarias con implementaciones *mock* del repositorio se documenta en el capítulo dedicado a las pruebas del sistema». La palabra «mock» aparecía **0 veces** en todo el capítulo de pruebas, que además declara que la lógica reubicada «no fue acompañada de una *suite* de pruebas unitarias propia»: la remisión apuntaba a un capítulo que la negaba. Se eliminó la remisión y la oración ahora afirma solo que el patrón *habilita* la validación aislada mediante repositorios *mock*, con la evidencia del resultado situada en la estructura del código y la limitación remitida al apartado que sí la declara. Se corrigió el mismo eco en la celda del objetivo B de `8.6-sintesis-objetivos-resultados.tex`.

- **C2 (T3), actividad comprometida y no ejecutada.** La actividad D del objetivo B, en `utils/objetivos-especificos.tex`, comprometía la «validación del desacoplamiento mediante pruebas unitarias del *service* con implementaciones *mock* del repositorio», que el apartado de limitaciones contradice. Se reformuló hacia lo efectivamente ejecutado: el diseño de los repositorios como contratos definidos por interfaz que habilitan esa sustitución, verificado por inspección de la arquitectura resultante. Esa macro se expande en el capítulo de alcance y en la tabla de síntesis de objetivos; se recompiló y ninguna de las dos tablas quedó descuadrada.