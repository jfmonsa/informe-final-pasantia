# Defensa — ataques probables y respuestas preparadas

**Trabajo:** Evolución arquitectónica y aseguramiento de calidad de la plataforma Paralegales mediante una arquitectura híbrida Firebase y AWS
**Autor:** Juan Felipe Monsalve Vargas · Director: Ms.C Royer David Estrada Esponda
**Uso:** repasar antes de la sustentación. Cada ataque trae: qué dirán · por qué duele · respuesta (20–60 s) · dónde está la evidencia · qué NO decir.

> Referencias de página son del PDF exportado (`slides/dist/sustentacion-preview.pdf`, 54 págs). **Ojo:** los rótulos "Slide N" de las notas del orador son etiquetas internas y **no coinciden** con las páginas del PDF (las separadoras de sección y los pasos de clic desplazan la numeración). Cita secciones del informe, no números de slide, cuando respondas.

---

## 0. El patrón de ataque: cómo piensa un evaluador riguroso

De la rúbrica institucional y de una evaluación real del mismo formato (`Evaluación informe final (evaluacion AKCS)`), el eje de la crítica es **siempre el mismo**:

> **"Desconexión entre lo que se prometió y lo que se documentó."**
> El trabajo promete un alcance mayor al que metodológicamente se ejecutó.

De ahí se derivan los dos vectores concretos:

1. **Trazabilidad roto**: objetivo que no tiene metodología, metodología que no tiene resultado, resultado que no tiene objetivo. La rúbrica lo exige literalmente ("correspondencia directa entre objetivos, metodología implementada y resultados obtenidos").
2. **Sobreinterpretación**: afirmar más de lo que la evidencia sostiene (el caso de la evaluación AKCS: "el FT-IR no certifica pureza", "la Artemia no certifica biocompatibilidad").

**Estrategia general de defensa: llegar primero.** Toda limitación que declares tú deja de ser un hallazgo del jurado y pasa a ser evidencia de tu rigor. Tu informe ya hace esto bien (8.6 Limitaciones, 8.4 resultado C sin SLOs, alcance 5.1 con exclusiones); la sustentación debe hacerlo con la misma disciplina.

**Regla de oro al responder:** *reconocer el límite → nombrar la decisión que lo produjo → mostrar el criterio → señalar dónde está declarado.* Nunca defender un hueco negándolo.

---

## 1. Trazabilidad problema ↔ objetivo

### Ataque #1 — "¿Cómo se relaciona el problema 3 con el objetivo C?" (o: "su mapeo no es 1:1")

**Qué dirán:** presentaste cuatro frentes de problema y cuatro objetivos. ¿Cuál objetivo atiende el *vendor lock-in*? ¿Y por qué el objetivo C (observabilidad) no tiene un problema propio?

**Por qué duele:** porque el mapeo **no es biyectivo** y la nota del orador afirmaba "1:1" (ya corregida). El mapeo real:

| Frente (pág. 6) | Objetivo que lo atiende |
|---|---|
| 1 · Lógica crítica expuesta | **A** — directo |
| 2 · Fragmentación arquitectónica | **B** — directo |
| 3 · *Vendor lock-in* parcial | **B** (repositorio por interfaz) · **C** de forma habilitante |
| 4 · Sin observabilidad *ni* prácticas de ciclo de vida | **C + D** — un frente, dos objetivos |

**Respuesta (40 s):**
> "La correspondencia es de cobertura, no biyectiva, y es deliberado. El frente 4 se desdobla en C y D porque observabilidad y aseguramiento de calidad de proceso son prácticas de naturaleza distinta, con artefactos distintos. El frente 3 no genera un objetivo propio porque **no es un defecto a corregir, es una condición de fondo**: el informe lo dice explícitamente — por sí solo no justifica una intervención disruptiva. Se atiende estructuralmente en B, con el repositorio definido por interfaz, y el objetivo C lo vuelve *medible*."

**Si insisten en el vínculo con C, tres argumentos ordenados por fuerza:**

1. **La observabilidad es precondición para poder salir del proveedor.** Sin telemetría no se puede migrar un componente fuera de Firebase sin disrumpir producción: no hay línea base de latencia, tasa de error ni volumen por flujo contra la cual comparar. C convierte el lock-in de *condición irreversible* en *costo medible*. **Respaldo empírico:** la migración Firestore → DynamoDB **se inició, se midió y la descartó la empresa por costo-beneficio** — esa evaluación fue posible porque había instrumentación. B deja la puerta abierta; C permite saber si vale la pena cruzarla.
2. **El contrato de telemetría vive en código propio, no en la consola del proveedor.** Si el diagnóstico depende de las herramientas del BaaS, la capacidad de *operar* el sistema también queda cautiva. El esquema JSON y los interceptores HTTP (actividades C.1 y C.2) son agnósticos del proveedor: lo único atado es el sumidero. Matiz honesto: hoy ese sumidero es CloudWatch — pero la **emisión** quedó desacoplada de la **recolección**.
3. **IaC como reproducibilidad** — infraestructura versionada y re-creable en vez de clics en consola, lo que ataca la dimensión operativa del lock-in (Harauzek, 2022). **Argumento débil: no lo lleves al frente** (ver ataque #7).

**Generalización que eleva la respuesta:** el frente 3 y la dependencia de la Rama Judicial son la misma clase de problema — *dependo de algo que no controlo*. La observabilidad es la respuesta general a esa clase: no puedes controlarlo, pero puedes verlo, y ver es lo que permite decidir con evidencia.

**NO decir:** "los cuatro frentes se convierten 1:1 en los objetivos" · "cada problema tiene su objetivo" · usar "frentes" para referirte a A–D (di **"líneas de intervención"**; el término colisiona y es lo que hace sonar a 1:1).

---

### Ataque #2 — "Tiene 5 subpreguntas y 4 objetivos. ¿Cuál sobra?"

**Por qué duele:** asimetría visible en el informe (§3, cinco subpreguntas) frente a cuatro objetivos.

**Respuesta (25 s):**
> "Ninguna sobra: cuatro subpreguntas mapean a los objetivos A–D y la tercera —bajo qué criterios decidir qué permanece en Firebase y qué se construye sobre AWS— es **transversal**. No produce un objetivo porque no produce un artefacto: produce el *criterio de frontera* con el que se tomaron las decisiones de los otros cuatro ejes. Es la pregunta que gobierna el carácter híbrido de la arquitectura."

**Ancla:** ese criterio es lo que hace que el híbrido sea *gobernado* y no *accidental* — enlaza con el ataque #12.

---

## 2. Objetivos: medibilidad y sobrepromesa

### Ataque #3 — "Sus objetivos específicos no son medibles"

**Qué dirán:** "reubicar", "refactorizar", "implementar", "consolidar" son verbos sin criterio de verificación. La rúbrica exige objetivos "formulados de manera medible".

**Por qué duele:** es un ataque formal legítimo y muy común. Los verbos, aislados, no son medibles.

**Respuesta (40 s):**
> "La medida no está en el verbo, está en el resultado esperado declarado para cada objetivo antes de ejecutarlo (§5.2.3, tabla objetivos ↔ resultados esperados), y cada uno se cerró con un criterio verificable:
> - **A** — criterio binario y observable: en el tráfico de red del navegador **ninguna petición sale hacia dominios gubernamentales**. Se demuestra en vivo en la demo.
> - **B** — evidencia estructural: 9 *bounded contexts* como Nuxt Layers, cadena Handler–Service–Repository con repositorio por interfaz, verificada por pruebas del *service* con mock.
> - **C** — cifras: 5 SLIs sobre 8 servicios en el namespace `Paralegales/RJU`, 2 alarmas con umbrales explícitos (>10 errores 5xx/5 min; p95 >5000 ms/5 min), traza correlacionada extremo a extremo.
> - **D** — 8 mecanismos a lo largo del ciclo de vida, 4 de ellos compuertas capaces de interrumpir la integración, y 16 casos de prueba de las reglas.
>
> Es decir: los objetivos se enuncian como intervención y se cierran contra evidencia, no contra percepción."

---

### Ataque #4 — "El objetivo B promete habilitar la evolución independiente de *cada motor tecnológico subyacente*, pero nunca sustituyeron el motor. Objetivo no alcanzado."

**Por qué duele:** **es el ataque más peligroso del trabajo.** Es exactamente el patrón "prometió optimizar y solo replicó" de la evaluación AKCS. El objetivo B usa la palabra *habilitando*, y la única prueba real de que una abstracción funciona es cambiar la implementación — y no se cambió: DynamoDB se inició y se descartó.

**Respuesta (50 s) — no la improvises:**
> "El objetivo dice *habilitar*, no *ejercer*, y esa formulación es deliberada: sustituir el motor está **explícitamente fuera del alcance** (§5.1, exclusión b). Lo que se afirma es verificable: la decisión de persistencia dejó de estar acoplada a la lógica de negocio. Y hay una verificación real, no retórica — **el mock ES una segunda implementación de la misma interfaz**, y el *service* corre completo contra ella sin base de datos. Si la abstracción filtrara detalles de Firestore, esas pruebas no podrían existir.
> Y hay una verificación empírica adicional que casi ningún trabajo tiene: la migración a DynamoDB **no se especuló, se intentó**. Se implementó, se midió su costo-beneficio y la organización la descartó. El patrón se adoptó *para* esa migración y se conservó por su valor propio: testabilidad y desacoplamiento."

**Delimitación que debes decir tú, antes de que la digan ellos:**
> "Lo que no puedo afirmar es que el motor sea sustituible *en producción*: no se demostró con un segundo motor productivo. Lo demostrado es que la sustitución ya no exige tocar la lógica de negocio."

**NO decir:** "el motor de persistencia es sustituible" como hecho consumado · "podemos migrar a DynamoDB cuando queramos".

---

### Ataque #5 — "¿No es sobreinterpretación decir que la lógica crítica ya no es inspeccionable, si el cliente sigue hablando con Firestore por el SDK?"

**Por qué duele:** **es el hueco menos cubierto en las diapositivas.** El frente 1 era la exposición en el cliente; la arquitectura final (pág. 13, diagrama global) mantiene la flecha `Cliente --SDK--> Firestore`. Un jurado técnico agudo verá que la exposición se **mitigó**, no se **eliminó**, y que el resultado A afirma más de lo que la arquitectura muestra.

**Respuesta (50 s):**
> "Correcto, y la distinción importa: lo que se reubicó es la **lógica de negocio** —validaciones, orquestación, cuotas, redención de vouchers—, no todo el acceso a datos. El acceso directo del cliente a Firestore persiste por una decisión de alcance: eliminarlo exigiría reescribir el frontend, que es justo la intervención disruptiva que el proyecto descarta.
> Ese acceso residual quedó gobernado por **defensa en profundidad**: las reglas de seguridad de Firestore se evalúan **en los servidores de Google, antes de cada lectura y escritura** — no en el cliente, y por tanto no son manipulables desde el navegador. Y para no afirmarlo sin verificarlo, son el único artefacto del sistema con *suite* de pruebas automatizada propia: 16 casos con predominio de casos negativos, sobre el mismo `firestore.rules` que se despliega, integrada como compuerta del CI.
> La afirmación precisa del resultado A es: **la lógica de negocio crítica dejó de ser inspeccionable y manipulable; el acceso a datos remanente dejó de ser irrestricto.**"

**Dato de refuerzo (tenlo listo):** antes de las reglas, cualquier usuario podía leer datos de *otro* usuario manipulando el SDK, y alterar `remaining_searches` para regalarse búsquedas ilimitadas. Ese es el "antes" concreto.

**NO decir:** "ya nada de lógica está en el cliente" · "el frontend ya no toca la base de datos".

---

## 3. Objetivo C — observabilidad

### Ataque #6 — "Observabilidad sin SLOs, sin *error budgets* y sin MTTR no es observabilidad: es *logging* con alarmas"

**Por qué duele:** es cierto que faltan los tres. Ya está declarado (§8.4 del resultado C) y hay caja de "delimitación honesta" en la slide de resultado C — úsala como escudo, no la escondas.

**Respuesta (40 s):**
> "Los tres faltan y está declarado en el informe. Pero la limitación es **de disponibilidad de datos, no de diseño**: SLOs, *error budgets* y MTTR exigen una serie histórica de producción y un registro sistemático de incidentes con marcas de detección y restablecimiento — y el subsistema que produce esas series **se puso en operación dentro de la propia pasantía**. No se puede fijar un objetivo de disponibilidad sobre un indicador que empezó a medir hace semanas.
> Lo que sí se construyó es la condición previa e indispensable: los indicadores. 5 SLIs sobre 8 servicios, dimensionados por servicio, con dos alarmas ya operando en producción. Declarar los SLOs sobre esa base es la continuación natural, y está en trabajo futuro."

**Además, distingue el nivel:** "correlación extremo a extremo con un `correlation-id` propagado a través de BFF, Lambdas e integraciones externas no es *logging*: es trazabilidad distribuida. Los logs son islas; la traza es el viaje."

---

### Ataque #7 — "Usan CloudFormation, que es propietario de AWS. ¿No agrava el lock-in que ustedes mismos denuncian en el frente 3?"

**Por qué duele:** es el contraataque exacto al argumento 3 del ataque #1. Es un golpe justo. **No abras este flanco tú.**

**Respuesta (35 s) — reconocer sin ceder el punto principal:**
> "Es una dependencia real de AWS, sí, y no voy a defender lo contrario. La elección se rige por el mismo criterio de frontera de la subpregunta 3: lo que ya está en AWS se gobierna con las herramientas nativas de AWS, sin añadir una capa de abstracción ni un plano de estado nuevo que el equipo tendría que aprender y operar. Para un equipo reducido, el costo de introducir Terraform u OpenTofu no se paga con el beneficio de portabilidad de una infraestructura que ya es específica de AWS — CloudWatch, SNS, filtros de métricas.
> Donde sí hay mitigación real del lock-in es un nivel más abajo: **la telemetría se emite en un esquema propio y estándar**, no en un formato del proveedor. El sumidero es reemplazable; el contrato de los eventos es nuestro. Y migrar a OpenTofu es una línea razonable de trabajo futuro."

**NO decir:** "IaC mitiga el vendor lock-in" a secas — es la afirmación que este ataque destruye.

---

### Ataque #8 — "¿Midieron el costo de la telemetría? ¿Cuánto latencia y cuánto dinero añadió?"

**Por qué duele:** no está medido ni declarado. Es un hueco real y pequeño; no lo infles.

**Respuesta (20 s):**
> "No se midió, y no debería afirmar lo que no medí. La instrumentación se diseñó para minimizarlo —interceptores en la ruta de salida, sanitizers, logs estructurados sin cuerpos completos— y el impacto no fue perceptible en la validación en *staging*, pero no tengo una cifra de sobrecosto en latencia ni de gasto en CloudWatch. Cuantificarlo entra en la misma línea de trabajo futuro que los SLOs."

---

## 4. Objetivo D — pruebas y calidad continua

### Ataque #9 — "El aporte central del trabajo es la lógica que reubicó al servidor, y esa lógica **no tiene pruebas propias**"

**Por qué duele:** **es el hueco más grande y el más difícil de defender.** Tu propio informe lo declara como la primera y más significativa limitación (§8.6): la lógica reubicada no tiene *suite* propia, se apoya en la línea base en Go cuya autoría es mayoritariamente de la empresa, y esa línea base **no corre en el pipeline de CI**. Un evaluador que lea 8.6 llegará con esta pregunta redactada.

**Respuesta (60 s) — la respuesta es reconocerlo, no esquivarlo:**
> "Es la limitación principal del trabajo y está declarada como tal en el informe, no como omisión sino como consecuencia de una decisión que puedo sustentar.
> El esfuerzo de automatización se asignó **por riesgo, no por cobertura uniforme**: plataforma en producción, equipo reducido, ventana de pasantía. Las reglas de seguridad reúnen simultáneamente el mayor impacto de un fallo —expone datos de usuarios reales— y la menor volatilidad —cambian poco—. Esa combinación da el mejor retorno por caso escrito, y ahí se construyó la automatización.
> La consecuencia, dicha con precisión: **una regresión en la lógica reubicada no queda bloqueada automáticamente antes de integrarse.** Depende de la ejecución local de las pruebas en Go y de la validación manual sistemática en *staging*, con los casos CP-01 a CP-06 documentados sobre `stage.paralegales.co`, réplica de producción.
> Y la corrección de menor costo ya está identificada como primera línea de trabajo futuro: **integrar al CI la suite en Go que ya existe** — convierte en compuerta automática una batería ya escrita, sin redactar un solo caso nuevo."

**Ancla honesta:** "el aseguramiento de este trabajo es de **proceso** —SQA en el sentido de IEEE 730—, no una suite de tests. Esa asimetría es el resultado buscado por la asignación por riesgo, no un descuido."

**NO decir:** "sí hay pruebas de la lógica del backend" (las hay, pero no son tuyas y no corren en CI — te desmontan en un segundo) · "QA" a secas.

---

### Ataque #10 — "16 casos de prueba es muy poco para un trabajo de grado"

**Respuesta (30 s):**
> "El número por sí solo no es la unidad de medida correcta. Dos precisiones:
> Primera, el aseguramiento de calidad de este trabajo son **8 mecanismos distribuidos a lo largo del ciclo de vida** —análisis estático, formato, convenciones de historial, control del flujo de ramas, suite de reglas, pruebas en Go, validación manual, observabilidad posdespliegue—, de los cuales **4 son compuertas** capaces de interrumpir la integración de un cambio. La suite es uno de ocho.
> Segunda, los 16 casos cubren **completo** el artefacto de mayor impacto del sistema, con predominio de casos negativos —verificar que un acceso indebido queda bloqueado—, con *matchers* propios `toAllow`/`toDeny`, sobre el mismo `firestore.rules` que se despliega. No son 16 casos sobre una superficie amplia: son 16 casos que agotan la superficie crítica."

---

### Ataque #11 — "¿Midieron cobertura de código?"

**Respuesta (20 s):**
> "No, y está declarado como la tercera limitación (§8.6). Precisamente por eso el informe **no afirma un nivel de cobertura** en ninguna parte: afirmar cobertura sin instrumentarla sería exactamente el tipo de sobreinterpretación que quise evitar. Publicar artefactos de cobertura con un umbral mínimo que impida su degradación es la tercera línea de trabajo futuro."

---

### Ataque #12 — Trampas de terminología (te desmontan por una palabra)

| Si el jurado cita… | Realidad | Respuesta |
|---|---|---|
| **"la suite E2E con Playwright"** (§8.4 de pruebas) | Existe una **base exploratoria** con POM y fixtures, **fuera del CI** | "Es una base exploratoria mínima, no una suite operativa ni una compuerta — no está integrada por intermitencia y costo de mantenimiento. Por eso ampliar E2E es trabajo futuro." |
| **"TDD"** (el informe lista prácticas XP "cuando resultara pertinente") | **No se hizo TDD** | "La práctica XP adoptada fue *pair programming*. Las pruebas del trabajo se escribieron como verificación, no como desarrollo guiado por pruebas." |
| **"QA"** | El trabajo es SQA de **proceso** | Di siempre "aseguramiento de calidad" o "calidad continua". "QA" hace que el jurado espere una suite de tests. |
| **"el OTP está en el informe"** | El informe **no dedica sección** al OTP | Preséntalo como mejora de producto que aplica el patrón del objetivo B. El respaldo es el código (`OtpDialog.vue`, `useUpdateUserPhones.ts`), no una sección. No cites sección. |
| **"9 bounded contexts"** | Son 9 directorios en `features/` | Correcto, pero no los llames "microservicios" ni "módulos independientes despliegue a despliegue": son *bounded contexts* como Nuxt Layers en un solo despliegue. |

---

## 5. Arquitectura y decisiones

### Ataque #13 — "Un híbrido es lo peor de dos mundos: dos proveedores, dos modelos de autorización, doble costo operativo"

**Por qué duele:** es la crítica arquitectónica de fondo. Si la respondes mal, todo el trabajo parece una racionalización de un accidente.

**Respuesta (45 s):**
> "El híbrido no se eligió desde cero: **se heredó**. La plataforma ya era híbrida cuando empezó el trabajo — Firebase para auth y datos, Lambdas en Go para lógica del servidor — y lo era de forma **accidental**: sin patrones que gobernaran las fronteras. Ese era precisamente el frente 2.
> Lo que hizo este trabajo no fue crear el híbrido, sino **volverlo explícito y gobernado**: definir bajo qué criterios una responsabilidad permanece en Firebase y bajo cuáles se construye sobre AWS —la tercera subpregunta— y materializar esas fronteras en la arquitectura. Hoy el cliente tiene cuatro conversaciones, cada una con una frontera declarada, en lugar de una maraña.
> Y la alternativa —unificar— no es una hipótesis: se probó. La migración a DynamoDB se implementó, se midió, y la organización la descartó por costo-beneficio. El costo de unificar era mayor que el costo de gobernar bien la heterogeneidad."

---

### Ataque #14 — "¿Por qué un BFF y no otra Lambda? ¿No añadió una capa por moda?"

**Respuesta (30 s):**
> "El criterio fue la **afinidad con el ciclo de vida de la sesión del usuario** — es la primera actividad del objetivo A: inventariar la lógica sensible y clasificar cada flujo según ese criterio. Los flujos que necesitan el contexto de la sesión, cookies y renderizado del servidor viven mejor en el server de Nuxt, que ya existía en el despliegue: el BFF no añadió infraestructura, aprovechó la que ya estaba. La lógica de servicio y las integraciones asíncronas fueron a Lambdas.
> El BFF además resuelve tres cosas que una Lambda no resolvía igual de bien en este caso: oculta los endpoints gubernamentales del tráfico del navegador, elimina el problema de CORS y centraliza saneamiento y manejo de errores para *este* frontend. Ese es exactamente el patrón de Newman."

---

### Ataque #15 — "La integración con la Rama Judicial es por ingeniería inversa. ¿Es legal? ¿Es sostenible?"

**Por qué duele:** doble filo, **ético/legal** y **técnico**. Es una pregunta que un jurado de ingeniería puede hacer con genuina curiosidad y que suena mal si titubeas. → **Verifica los puntos marcados antes de la sustentación** (ver §7).

**Respuesta sobre legalidad (30 s):**
> "Se consultan datos que son públicos por mandato de publicidad procesal, a través del portal público de la Rama Judicial, sin vulnerar ningún control de acceso ni autenticarse indebidamente: es la misma consulta que un abogado haría manualmente en el navegador. El valor del producto no está en acceder a datos restringidos, sino en **automatizar una revisión que hoy es manual** y notificar los cambios. La ingeniería inversa fue del *protocolo* de un portal público sin API documentada, no de un sistema cerrado."

**Respuesta sobre sostenibilidad (25 s) — y aquí conectas con C:**
> "Es frágil por diseño ajeno: sin SLA, sin versionado, sin aviso de cambios. Y esa fragilidad es exactamente la razón de ser del objetivo C. Un cambio de contrato o una caída del proveedor se manifiesta como picos de 5xx o de latencia, los filtros de métricas los convierten en señal, y la alarma llega a Telegram en minutos. **El equipo se entera antes que los usuarios, y distingue en segundos fallo propio de fallo del proveedor.** No podemos evitar que cambien; sí podemos enterarnos el mismo día. Encapsularla en el BFF además concentra el punto de reparación en un solo lugar."

---

## 6. Modalidad de pasantía: aporte propio vs. trabajo del equipo

### Ataque #16 — "¿Qué hizo usted y qué hizo la empresa?"

**Por qué duele:** es **la pregunta estructural de toda pasantía en convenio**, y tu propio informe admite que la línea base de pruebas en Go es mayoritariamente del equipo (§8.6). Si no tienes la frontera clara y memorizada, todo el trabajo queda en duda.

**Respuesta (45 s) — ten la lista lista, con nombres:**
> "Mi contribución está delimitada en el informe. Lo construido por mí: el **BFF** en `paralegales-ui` —inexistente en la arquitectura previa—, incluida la ingeniería inversa de la integración con Rama Judicial y SAMAI; el **subsistema de observabilidad transversal** completo (`shared/observability/`: `logging.go`, `context.go`, interceptores en ambas capas, filtros de métricas, alarmas y el aprovisionamiento en CloudFormation); la **reorganización del frontend** en *bounded contexts* con Nuxt Layers y el aislamiento del tema; la **migración de la lógica vulnerable** al servidor (follow/unfollow —PR #246, ~350 líneas de lógica de negocio eliminadas del cliente—, cuotas de búsqueda, redención de vouchers); el **`firestore.rules` y su suite de 16 casos**; y toda la **automatización del ciclo de vida** (Lefthook, Commitlint, CI con validación diferencial).
> Lo que **no** es mío y el informe lo dice: la línea base de pruebas unitarias en Go del repositorio de servicios es mayoritariamente del equipo.
> Y hay una contribución que no es de código: los patrones —Handler–Service–Repository, componente–composable–repository— quedaron **adoptados por el equipo como estándar de las features nuevas**, discutidos con el Tech Lead y el Product Owner. Eso es contribución de proceso, y es la parte que sobrevive a mi salida."

---

### Ataque #17 — "¿Esto es un trabajo de grado o el trabajo de un empleado? ¿Dónde está el componente investigativo?"

**Respuesta (40 s):**
> "Es investigación aplicada de base tecnológica, ejecutada *in vivo*: se interviene una organización real, en madurez TRL 7 a 9 —demostración, validación y despliegue en entorno real—, bajo la estrategia de Chavarriaga y Arboleda. Los tres momentos están en el trabajo:
> **Investigación y desarrollo inicial**: el diagnóstico de los cuatro frentes, el estado del arte y las pruebas de concepto — incluida la migración a DynamoDB, implementada y descartada con evidencia.
> **Investigación aplicada**: la intervención sobre la plataforma en producción.
> **Transferencia**: la documentación en la empresa, este informe y la replicabilidad del enfoque.
> El aporte académico no es el volumen de código: es el **diagnóstico, el criterio de decisión arquitectónica documentado y su validación empírica** en un sistema que no se podía detener. Un empleado entrega la feature; aquí lo entregado es además el razonamiento y la evidencia de por qué esa arquitectura y no otra — incluyendo la alternativa que se probó y se rechazó."

---

### Ataque #18 — "¿Cómo demuestra que 'no disrumpió producción'? Es la restricción central del trabajo y no veo cómo la midió"

**Por qué duele:** la restricción aparece en el objetivo general, en la pregunta central y en las conclusiones — y **no hay una métrica de no-disrupción** (cero incidentes, *downtime*, tasa de error antes/después). Es un flanco de sobreinterpretación no cubierto en las diapositivas.

**Respuesta (35 s) — honesta, apoyada en proceso:**
> "No lo mido con una cifra de *downtime*, y no debería presentarlo como si la tuviera. Lo que puedo sustentar es el **mecanismo** que hizo posible la restricción: ningún cambio llegó a producción sin pasar por la rama de integración y por *staging* —`stage.paralegales.co`, réplica de producción, con los casos CP-01 a CP-06—, ni sin atravesar las compuertas automáticas del CI; y la intervención fue incremental, módulo por módulo, nunca un corte de versión.
> La evidencia negativa es que la plataforma siguió operando con usuarios reales y el equipo siguió entregando features durante toda la intervención — de hecho, los módulos que presenté se construyeron *sobre* la arquitectura nueva mientras se refactorizaba. Cuantificarlo requeriría la serie histórica y el registro de incidentes que los SLIs empezaron a acumular: es la misma limitación de datos del resultado C."

---

## 7. Verifica esto ANTES de la sustentación

No pude confirmarlo desde el repositorio y son puntos donde una respuesta improvisada te puede costar:

- [ ] **Rate limiting / cortesía hacia el portal de la Rama Judicial.** ¿El BFF limita la frecuencia de consultas? Si sí, dilo en el ataque #15 (refuerza mucho el argumento ético). Si no, **no lo afirmes**.
- [ ] **Términos de uso del portal de la Rama Judicial.** ¿El informe los menciona en algún lado? Si el jurado pregunta y no lo revisaste, la respuesta correcta es "no evalué los términos de uso del portal; el acceso es a datos públicos por publicidad procesal" — no inventes que los cumples.
- [ ] **Número exacto de casos CP-** en la validación en *staging* (las notas dicen CP-01…CP-06; confirma en §8.3).
- [ ] **PR #246 y los commits citados** (`delegate process follow/unfollow to backend`, `move voucher redemption logic to backend`): confirma números y magnitudes antes de citarlos en voz alta. Una cifra mal citada frente a un jurado técnico cuesta más de lo que aporta.
- [ ] **Numeración del PDF exportado**: 54 páginas frente a ~34 slides planeadas. Revisa si el export está incluyendo pasos de clic; si vas a navegar a una slide de apoyo durante las preguntas, ensaya cómo llegar.
- [ ] **Las 4 slides de apoyo**: solo hay 3 títulos en `08-backup.md` (metodologías ágiles, marco de referencia, por qué no migrar todo a AWS). El plan menciona los CP-01…CP-06 en apoyo — **falta esa slide**, y es la que respalda el ataque #9. Considera añadirla.

---

## 8. Auditoría: resultados esperados del informe que las slides NO muestran

Contraste de la tabla §5.2.3 del informe (*Relación objetivos específicos y resultados esperados*) contra el bloque de Resultados del deck. Cada fila sin cubrir es una frase donde el jurado puede decir *"usted prometió esto en el informe y no lo presentó"* — el patrón de ataque de §0.

| # | Resultado esperado (informe §5.2.3) | Obj. | Estado en Resultados |
|---|---|---|---|
| 1 | Repositorios por interfaz **que habilitan pruebas unitarias sin acceso a la base de datos real** | B | **Ausente** |
| 2 | Suite de pruebas de las reglas con **Vitest sobre la Firebase Emulator Suite** | D | Solo en una celda de la tabla de cierre, sin evidencia visual |
| 3 | Lógica crítica de los módulos de procesos **y campañas** del lado del servidor | A | Solo procesos (follow/unfollow, cuotas, vouchers) |
| 4 | CI con **validación diferencial sobre los archivos modificados** | D | **Ausente** ("CI operativo y obligatorio") |
| 5 | Hooks **pre-commit, commit-msg y post-merge** con ESLint, Prettier y Commitlint | D | Solo Commitlint (el commit rechazado) |
| 6 | BFF con **saneamiento** y **manejo centralizado de errores** | A | **Ausente** |
| 7 | Repositorios por interfaz que **preservan la opción de sustituir el motor** | B | **Ausente** en Resultados (sí en Desarrollo) |
| — | Los tres resultados esperados del objetivo **C** | C | **Cubiertos** (telemetría + dashboard + alarmas/Telegram + CloudFormation) |

**Orden de importancia:**

1. **#1 — las pruebas con mock, sin base de datos real.** El hueco más costoso. Es la **única verificación real de que la abstracción del repositorio funciona**, y por tanto la respuesta al ataque #4 ("prometió habilitar la sustitución del motor y nunca lo sustituyó"). Hoy el jurado no ve ninguna evidencia de que la interfaz sea algo más que una declaración de intenciones. Debería ser un bullet de Resultado B.
2. **#2 — la suite de reglas sin evidencia propia.** Es el artefacto más fuerte del objetivo D —16 casos, compuerta del CI, el único con automatización real— y está enterrado en una celda de tabla. La captura de la corrida existe (`pruebas-rules-run.png`) pero quedó en las slides de apoyo.
3. **#3 — campañas.** El resultado esperado nombra dos módulos y Resultado A muestra uno. El módulo de campañas sí aparece en Desarrollo (event-driven, SQS), pero no se cierra como resultado del objetivo A.
4. **#4 y #5 — precisión de D.** "Validación diferencial" y el conjunto completo de hooks son detalles que suenan a rigor y hoy se pierden.
5. **#6 y #7 — menores.** Están dichos en Desarrollo; el costo de omitirlos en Resultados es bajo.

**Nota sobre #7:** no basta con añadir la frase. Si la pones en Resultados, dila como en el ataque #4 — *"la sustitución dejó de estar acoplada a la lógica de negocio"*, nunca *"el motor es sustituible"*.

---

## 9. Chuleta final

**Frases ancla (memorízalas):**
- "Los cuatro frentes se **atienden** con las cuatro líneas de intervención." *(nunca "1:1")*
- "El frente 3 no es un defecto a corregir, es una **condición de fondo**: B la mitiga, C la vuelve medible."
- "La migración a DynamoDB **no se especuló: se intentó, se midió y se descartó**."
- "Aseguramiento de calidad **de proceso** — SQA en el sentido de IEEE 730 — no una suite de tests."
- "El esfuerzo se asignó **por riesgo, no por cobertura uniforme**."
- "Está declarado en el informe como **decisión de costo-beneficio, no como omisión**."
- "Las reglas se evalúan **en los servidores de Firestore**, no en el cliente."
- "No fue una liquidación de la deuda técnica, sino un **pago selectivo de sus partidas de mayor interés** — y la deuda que se conserva quedó **visible mediante telemetría**." *(Kruchten)*

**Frases prohibidas:**
- ~~"1:1"~~ · ~~"un objetivo por problema"~~ · ~~"frentes" para A–D~~
- ~~"QA"~~ a secas
- ~~"el motor de persistencia es sustituible"~~ *(di: "la sustitución ya no está acoplada a la lógica")*
- ~~"ya no hay lógica en el cliente"~~ *(di: "la lógica de negocio crítica")*
- ~~"tenemos una suite E2E"~~ *(di: "una base exploratoria, fuera del CI")*
- ~~"TDD"~~
- ~~"IaC mitiga el vendor lock-in"~~ *(CloudFormation es propietario — te lo devuelven)*
- ~~"la cobertura es buena"~~ *(no se midió)*
- ~~"no hubo caídas"~~ *(no lo mediste — habla del mecanismo)*

**Si te preguntan algo que no sabes:** "No lo medí / no lo evalué, y no quiero afirmarlo sin evidencia. Lo que sí puedo sustentar es…" — y rediriges a lo que sí tienes. Un "no lo sé" acotado y honesto cuesta muy poco; una afirmación desmontada cuesta el resto de la defensa.
