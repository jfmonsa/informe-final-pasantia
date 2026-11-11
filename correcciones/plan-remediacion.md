# Plan de remediación — hallazgos del agente revisor

Orden de trabajo para el agente que aplicará las correcciones sobre
`informe-final-pasantia-latex-jfmonsa`. Deriva de la auditoría de las 7
observaciones del jurado contra el código fuente, `bibliografia.bib` y los
commits citados en `correcciones/correcciones.md`.

**Contexto obligatorio antes de empezar:** `correcciones/correcciones.md` es el
reporte del estudiante, no evidencia. Varias de sus afirmaciones resultaron
falsas o parciales al verificarlas. No lo tomes como fuente de verdad; este
documento ya incorpora el resultado de la verificación.

---

## RESTRICCIÓN DURA: ninguna imagen será cambiada

**No se modificará, reemplazará, revertirá, recortará, redactará ni regenerará
ningún archivo de `img/`.** Esto es una decisión ya tomada, no un criterio a
reevaluar.

Queda explícitamente prohibido:

- editar, sobrescribir o borrar cualquier `.png` bajo `img/figures/` o `img/template/`;
- revertir `cde89da` o cualquier otro commit que toque binarios de imagen;
- ejecutar herramientas de imagen (`convert`, `mogrify`, `magick`, `pngcrush`, etc.);
- reescribir el historial de git para purgar imágenes;
- proponer «solo un recorte rápido» de una captura.

Si una tarea pareciera exigir tocar una imagen, **no la hagas**: escríbela en la
sección «Escalamiento al autor» al final de tu reporte y sigue con lo demás.

Consecuencia directa que debes asumir como dada: **la Figura 35
(`fig39-resultado-ci.png`) no se puede actualizar**, y las Figuras 3, 6, 10, 13,
27 y 28 se quedan como están. Todo el plan de abajo está construido sobre ese
supuesto.

---

## Alcance

| Tarea | Ítem del jurado | Severidad | Estado |
|---|---|---|---|
| T1 — Corregir la afirmación falsa sobre la compuerta de CI | 6 | Bloqueante | Obligatoria |
| T2 — Reparar referencia cruzada rota a pruebas con *mock* | Colateral C1 | Mayor | Obligatoria |
| T3 — Alinear actividad D del objetivo B con las limitaciones | Colateral C2 | Mayor | Obligatoria |
| T4 — Unificar el nombre del patrón `Handler--Service--Repository` | 2 | Menor | Obligatoria |
| T5 — Reponer «Aseguramiento de calidad» en palabras clave | 1 | Menor | Obligatoria |
| T6 — Invocar el marco teórico nuevo en resultados y conclusiones | 3 | Menor | Obligatoria |
| T7 — Actualizar `correcciones/correcciones.md` al estado real | — | Menor | Obligatoria |
| T8 — Precisión sobre el panel de observabilidad | 7 | Menor | **Solo con confirmación del autor** |
| T9 — Retiro de figuras con datos personales | 5 | Bloqueante | **Solo con confirmación del autor** |
| — Mejora de pantallazos | 4 | Mayor | **Fuera de alcance** (requiere tocar imágenes) |
| — Redacción de datos personales en las capturas | 5 | Bloqueante | **Fuera de alcance** (requiere tocar imágenes) |

---

## T1 · Corregir la afirmación falsa sobre la compuerta de CI (Bloqueante)

### El problema

El informe afirma en cuatro lugares que la suite de reglas de seguridad de
Firestore se ejecuta como compuerta obligatoria en el pipeline de CI. **Es
falso.** En `paralegales-ui`, la rama publicada (`HEAD`, commit `ad22fb3`
—«refactor: comment out Firebase Emulator steps in CI pipeline») tiene los tres
pasos comentados. La activación existe únicamente como modificación **sin
commitear** en el árbol de trabajo (`git status` → ` M .github/workflows/ci.yml`).
Nunca ha corrido.

La Figura 35, que el informe presenta como evidencia del pipeline, muestra
corridas de 1m 22s – 1m 33s: tiempos incompatibles con aprovisionar la Firebase
Emulator Suite, instalar `firebase-tools` y correr `test:rules`. Como esa figura
**no se puede reemplazar**, la evidencia visual seguirá contradiciendo cualquier
afirmación de que la compuerta existe. Por eso la única salida coherente es
ajustar el texto.

### Qué NO hacer

- No commitees ni pushees `paralegales-ui/.github/workflows/ci.yml`. Esa es una
  decisión del autor sobre otro repositorio, y aunque se hiciera, la Figura 35
  seguiría sin respaldarla.
- No inventes una redacción que insinúe la compuerta sin afirmarla («está
  preparado para», «puede ejecutarse»). El jurado leyó bien la primera vez; la
  ambigüedad calculada es peor que la corrección franca.

### Qué hacer

Reescribir los cuatro pasajes para que digan lo que es cierto: la suite existe,
tiene 16 casos, se ejecuta localmente y de forma repetible sobre el emulador, y
**su integración al pipeline queda como trabajo futuro**. La compuerta de
validación estática diferencial sí opera y debe conservarse como tal.

Localiza por texto ancla, no por número de línea:

1. **`sections/8-pruebas-del-sistema-sub-sections/8.5-integracion-ci.tex`**
   - Ancla: «se ejecuta de forma obligatoria frente a cada \textit{pull request}
     dirigida a las ramas protegidas y aplica dos compuertas de calidad»
   - El pipeline aplica **una** compuerta de calidad (validación estática
     diferencial) más el control de flujo de ramas. Reescribe el párrafo
     introductorio y convierte el segundo ítem del `enumerate` en una
     descripción de la suite como mecanismo local, con su incorporación al
     pipeline remitida al trabajo futuro.
   - Ancla del párrafo de cierre: «una \textit{pull request} cuyas
     modificaciones rompan una regla de seguridad es bloqueada antes de
     promoverse». Esa oración afirma un bloqueo que no ocurre: reescríbela.

2. **`sections/8-pruebas-del-sistema-sub-sections/8.1-enfoque.tex`**
   - Ancla: «\textbf{Compuertas de integración:}»
   - Ajusta el ítem para que la obligatoriedad cubra solo lo que el pipeline
     realmente corre.

3. **`sections/8-pruebas-del-sistema-sub-sections/8.6-sintesis-limitaciones.tex`**
   - Ancla en la tabla: «compuerta obligatoria en CI»
     → la celda debe reflejar ejecución local; la columna «Momento» del
     mecanismo «Reglas de seguridad de Firestore» dice hoy «Local y *pull
     request*» y la columna «Automatización» dice «Automatizado». Corrígelas de
     forma consistente con el nuevo texto.
   - Ancla: «Cuatro de ellos actúan como compuertas automáticas capaces de
     bloquear la integración de un cambio, tres están automatizados sin operar
     como compuerta y uno es manual.»
     → **Recuenta a partir de la tabla ya corregida** y ajusta los tres números.
     No los adivines: cuéntalos.
   - Ancla: «que es la que quedó cubierta por pruebas automatizadas y compuertas
     obligatorias»
     → esa capa queda cubierta por pruebas automatizadas, no por compuertas
     obligatorias.

4. **Apartado de trabajo futuro** en el mismo archivo
   - Ancla: «(i) incorporar la ejecución de la \textit{suite} en Go existente al
     \textit{pipeline}»
   - Añade como línea de mejora la incorporación de la suite de reglas al
     pipeline de `paralegales-ui`, que es de costo mínimo (los pasos ya están
     escritos y comentados) y debería quedar primera en el orden por relación
     esfuerzo/garantía.

5. **Revisa también** `sections/9-conclusiones.tex` (ancla: «automatización
   obligatoria donde el riesgo es de seguridad») y
   `sections/8-resultados-sub-sections/8.5-objetivo-d-calidad.tex`, por si
   repiten la afirmación. Corrige cualquier eco.

### Criterio de aceptación

`grep -rn "compuerta obligatoria\|obligatoria" sections/` no devuelve ninguna
oración que atribuya obligatoriedad en CI a la suite de reglas, y el conteo de
mecanismos en 8.6 cuadra con la tabla.

---

## T2 · Reparar la referencia cruzada rota a pruebas con *mock* (Mayor)

`sections/8-resultados-sub-sections/8.3-objetivo-b-arquitectura.tex` afirma:

> «la verificación de ese desacoplamiento mediante pruebas unitarias con
> implementaciones *mock* del repositorio se documenta en el capítulo dedicado a
> las pruebas del sistema»

La palabra «mock» aparece **0 veces** en todo el capítulo de pruebas
(verificado). Peor: ese capítulo declara explícitamente que la lógica reubicada
«no fue acompañada de una *suite* de pruebas unitarias propia». La promesa
apunta a un capítulo que la niega.

**Acción:** elimina la remisión y reescribe la oración para que afirme solo lo
que es cierto — que el patrón *habilita* la validación aislada mediante
repositorios *mock*, sin afirmar que esa validación se realizó ni remitir a otro
capítulo. Verifica después que ninguna otra parte del documento prometa esa
misma evidencia.

---

## T3 · Alinear la actividad D del objetivo B (Mayor)

`utils/objetivos-especificos.tex`, macro `\objectivoEspecificoBActividadadD`:

> «Validación del desacoplamiento mediante pruebas unitarias del \textit{service}
> con implementaciones \textit{mock} del repositorio.»

Es una actividad comprometida en el alcance que el apartado de limitaciones
ahora contradice. Quedan dos salidas coherentes; **elige la primera salvo que el
autor indique lo contrario**:

- **(a)** Reformular la actividad hacia lo efectivamente ejecutado: el diseño de
  repositorios definidos por interfaz que *habilita* la sustitución por
  implementaciones *mock*, verificado por inspección de la arquitectura
  resultante.
- **(b)** Mantenerla y declararla expresamente como no cumplida en el apartado
  de limitaciones.

Esa macro se expande en el capítulo de alcance y probablemente en la tabla de
síntesis de objetivos; tras editarla, recompila y confirma que ninguna tabla
quede descuadrada por el cambio de longitud del texto.

---

## T4 · Unificar el nombre del patrón (Menor, ítem 2)

`sections/7-desarrollo-del-proyecto-sub-sections/7.2-arquitectura.tex` contiene:

> `patrón \textbf{Handler -- Service Struct -- Abstract Repository}`

Doble problema: LaTeX compone ` -- ` como raya (justo lo que el ítem 2 vino a
eliminar) y es un segundo nombre para un patrón que el resto del documento
llama `Handler--Service--Repository` en 8 lugares.

**Acción:** unificar a `Handler--Service--Repository`. Es la única ocurrencia; el
resto de `--` en el documento son guiones ortográficos legítimos o rangos de
páginas en `bibliografia.bib`, que **no** deben tocarse.

---

## T5 · Reponer «Aseguramiento de calidad» en las palabras clave (Menor, ítem 1)

El título del trabajo es «Evolución arquitectónica **y aseguramiento de calidad**
de la plataforma Paralegales…», pero al podar de 8 a 5 palabras clave se eliminó
precisamente «Aseguramiento de calidad».

**Acción en `sections/0.1-resumen.tex`:** mantener **cinco** palabras clave (el
jurado se quejó de que había demasiadas; no subas a seis) y sustituir
`\textit{Domain-Driven Design}` —una técnica subordinada al objetivo B— por
`Aseguramiento de calidad`. Aplica el cambio simétrico en la línea de
`\textbf{Keywords:}` (`Software quality assurance`).

Resultado esperado:

```
\textbf{Palabras clave:} Arquitectura de software híbrida, \textit{Backend-for-Frontend}, Aseguramiento de calidad, Observabilidad, \textit{Legaltech}.
\textbf{Keywords:} Hybrid software architecture, \textit{Backend-for-Frontend}, Software quality assurance, Observability, \textit{Legaltech}.
```

---

## T6 · Hacer que el marco teórico nuevo gobierne el resto del documento (Menor, ítem 3)

`Lehman1980` y `Kruchten2012` se citan **exclusivamente** dentro de
`sections/4-marco-de-referencia-sub-sections/4.2-marco-teorico.tex`. No aparecen
ni una vez en los capítulos 7, 8 o 9. El jurado que pidió ampliar el marco
teórico va a preguntar dónde se usa lo que se añadió.

**Acción:** dos inserciones breves, sin inflar el texto y sin métricas nuevas.

1. **`sections/9-conclusiones.tex`** — una o dos oraciones que lean la
   intervención con las categorías ya introducidas: la refactorización como el
   trabajo deliberado que la ley de complejidad creciente señala como
   imprescindible \cite{Lehman1980}, y el resultado como amortización selectiva
   de deuda con la porción restante hecha visible mediante telemetría
   \cite{Kruchten2012}.
2. **Un punto del capítulo de resultados** — el más natural es
   `sections/8-resultados-sub-sections/8.3-objetivo-b-arquitectura.tex`
   (refactorización) o la síntesis de objetivos: una oración que encuadre el
   resultado del objetivo B como pago de la partida de deuda de mayor interés.

Reutiliza el vocabulario ya establecido en 4.2 («programa de tipo E», «pago
selectivo», «deuda estructuralmente invisible») para que la conexión se lea como
continuidad y no como injerto.

---

## T7 · Actualizar `correcciones/correcciones.md` al estado real (Menor)

Ese archivo declara ✅ RESUELTO cosas que no lo están, y se contradice a sí
mismo. Debe reflejar el estado verificado, porque es el documento con el que el
autor se va a preparar:

- **Ítem 5:** no es «RESUELTO (parcial)». La redacción de la Figura 3 fue
  **revertida** por `cde89da` y el tablero WebDesk vuelve a mostrar el nombre
  completo de un tercero (~15 veces), avatares con rostro real y el correo del
  autor. Además el ítem se contradice: declara la Fig 10 como PENDIENTE y en la
  misma línea acredita `753d01c` como resuelta para la Fig 10; lo cierto es que
  ese commit tapó dos de cinco correos y dejó visible el institucional.
- **Ítem 6:** no es RESUELTO. La activación del CI sigue sin commitear, luego el
  informe afirma algo falso hasta que se aplique T1.
- **Conteo de figuras:** el ítem 5 dice «las 34 figuras usadas»; el `.lof` lista
  35 figuras numeradas.
- Marca el ítem 4 como PENDIENTE ASUMIDO con su riesgo, no como «ignorar por
  ahora».

---

## T8 · Precisión sobre el panel de observabilidad — requiere confirmación del autor

La Figura 27 muestra «No data available» en el panel de errores 5xx y series
casi vacías, y el banner de la consola dice `paralegales-stage (062141952574)`
mientras el dashboard se llama `RJU-Observability-**prod**`. La Tabla 5 y todo
el ítem 7 están impecablemente verificados contra
`paralegales-services/infrastructure/rju-observability.yaml`, pero la evidencia
visual invita la pregunta.

Como la figura no se puede reemplazar, la única mitigación posible es textual, y
**solo procede si el autor confirma los hechos**. Pregúntale:

- ¿La captura corresponde a una ventana de bajo tráfico? ¿A qué entorno?
- ¿El dashboard `RJU-Observability-prod` se despliega en la cuenta
  `paralegales-stage` por diseño (parámetro `Environment` de la plantilla)?

**No escribas ninguna explicación sin esa confirmación.** Una justificación
inventada sobre por qué el panel está vacío es peor que el panel vacío. Si el
autor no responde, deja el texto intacto y anótalo como riesgo para preparar la
respuesta oral.

---

## T9 · Retiro de figuras con datos personales — requiere confirmación del autor

Esta es la única mitigación del ítem 5 disponible sin tocar imágenes, y **cambia
contenido del informe**, así que no la ejecutes por iniciativa propia.

Estado verificado de la exposición (todo sigue en el PDF compilado):

| Figura | Archivo | Expuesto |
|---|---|---|
| 3 | `fig9-webdesk-kaban-board.png` | Nombre completo de un tercero ×15, rostros reales, correo del autor |
| 6 | `fig14-api-gateway.png` | Cuenta AWS `062141952574` + `AdministratorAccess/juan.felipe.monsalve` |
| 10 | `fig17-sso-google.png` | Nombre completo + `…@correounivalle.edu.co` + rostro real |
| 13 | `fig21-update-email-password-feature.png` | `jfmonsalveva@gmail.com` en claro |
| 27, 28 | `fig33-…`, `fig34-…` | Cuenta AWS + principal IAM |

Opción a proponer al autor: **eliminar del `.tex` el entorno `figure` de las
figuras más comprometidas** (candidata principal: la Figura 3, que expone datos
de un tercero identificable y es la de menor valor argumental) y reescribir el
párrafo que la referencia para que se sostenga sin ella. El archivo `.png`
permanece intacto en `img/`; solo deja de incluirse. Ojo: eliminar una figura
renumera todas las posteriores y rompe las referencias del propio
`correcciones.md`, así que hay que revisar los `\autoref` afectados y recompilar.

**Fuera del alcance de cualquier agente, escalar al autor como decisión
inmediata:** el repositorio `jfmonsa/trabajo-de-grado` es **público**
(`gh repo view` → `"visibility":"PUBLIC"`) y las imágenes sin redactar siguen en
el historial (commit `2402149`). Mientras siga público, el nombre del tercero,
los rostros, los correos y el ID de cuenta AWS con `AdministratorAccess` son
recuperables aunque el PDF quedara limpio. Pasarlo a privado no requiere tocar
ninguna imagen y es la acción de mayor impacto disponible hoy.

---

## Guardarraíles de redacción

Aplican a **todo** texto que escribas o reescribas en este repositorio:

1. **Prohibida la raya como inciso.** El ítem 2 se resolvió eliminando ~55
   incisos con `—`. Reintroducir uno solo es una regresión visible. Usa comas,
   paréntesis, dos puntos o divide la oración. Tampoco uses ` -- ` con espacios,
   que LaTeX compone como raya.
2. **No inventes datos.** Ninguna métrica, porcentaje, fecha ni resultado que no
   puedas verificar en el código fuente o en los repositorios hermanos. El ítem 7
   se resolvió bien precisamente porque no inventó nada.
3. **Español, registro académico, sin autobombo.** Iguala el tono existente: es
   sobrio y ya funciona.
4. **No amplíes el alcance.** Corrige lo listado. Si detectas un problema nuevo,
   anótalo en tu reporte final; no lo arregles por tu cuenta.
5. **No toques `bibliografia.bib`** salvo que una tarea lo pida (ninguna lo
   hace). Los `--` en los campos `pages` son correctos.

---

## Verificación antes de entregar

Ejecuta y confirma que todo pasa:

```bash
cd informe-final-pasantia-latex-jfmonsa

# 1. Ninguna imagen tocada — DEBE salir vacío
git status --porcelain img/
git diff --stat -- img/

# 2. Ninguna raya reintroducida — DEBE dar 0
grep -rc "—\|–" --include="*.tex" . | grep -v ":0" || echo "OK: sin rayas"

# 3. El patrón quedó unificado — DEBE salir vacío
grep -rn -- "Handler -- Service" sections/

# 4. Ya no se afirma la compuerta de CI — revisa cada resultado a mano
grep -rn "compuerta obligatoria\|de forma obligatoria" sections/

# 5. Compila y no quedan referencias ni citas rotas
make            # o el flujo de docker-compose del repo
grep -E "Reference .* undefined|Citation .* undefined" informe-final-pasantia-jfmonsa.log \
  || echo "OK: sin referencias rotas"
```

Además, revisa visualmente en el PDF que las tablas de 8.6 y de síntesis de
objetivos no se hayan descuadrado por los cambios de longitud del texto.

---

## Reporte final que debes entregar

1. Tabla tarea por tarea: qué cambiaste, en qué archivos, con el fragmento antes/después de los cambios de fondo (T1, T2, T3).
2. Salida literal de los cinco comandos de verificación.
3. **Escalamiento al autor:** todo lo que no pudiste hacer por la restricción de
   imágenes (ítems 4 y 5), más las preguntas abiertas de T8 y T9, más la
   visibilidad pública del repositorio.
4. Cualquier problema nuevo que hayas detectado y no hayas tocado.

No declares una tarea completada si no la verificaste. Si algo quedó a medias,
dilo con esas palabras.
