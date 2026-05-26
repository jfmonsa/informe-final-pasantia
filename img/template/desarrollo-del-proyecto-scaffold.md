goal: Crear el borrador del nuevo capitulo "Desarrollo del proyecto"

Stack tecnologico:
entre los 3 usamos Firebase para la autenticación y base de datos

paralegales-services: microservicios, Event driven architecture, AWS Lambda, SQS, SNS, CloudFormation IaC, Cloduwatch, Twilio para enviar mensajes de whatsapp programaticamente, Deppsek API, API Gateway, ETL pipeline
paralegales-ui: Nuxt, vue.js, Zod, Vuetify, Playwright, Vitest

Diseño de la arquitectura DDD en el frontend, adaptadores validación, reglas de seguridad def irestore, clean arquitecture: Servicios, repositories, controller (Abstract repository patternó el pryecto élecesito que exploré los repositorios para ctrar)

1, resumen de los modulos desarrollados durante la pasantia: 01. Auth (login, register, login con google todo atraves de firebase, verificación del correo del usuario).

2. Modulo de procesos: Funcionalidades core como buscar procesos integrando api externa de la rama judicial unificada la cual es una api publica pero como no tiene documentación le tuvimos que hacer reverse engenierring, implementamos, seguir procesos, dejar de seguir procesos, importación masiva de procesos

3. modulo de camapañas envio a un solo lead o envio masivo, tags customizadas / replacements tokens,

Introducción de linter, formateadores, tests unitarios para las reglas de seguridad de firestore usando el emulador de google para desarrollo local con firestore, testing e2e para probar a nivel funcionalidades principales de la app todo integrado atraves de piepeline de CI/CD en github actions

Observavilidad usando AWS

4. Otras tareas: Arreglar Bugs, Mejorar UI / UX de otros modulos, Analisis de procesos usando la API de Deepseek

## Stack Tecnologico

## Propmts

contexto: estoy creando el borrador el nuevo capítulo de mi proyecto de grado "Desarrollo del proyecto". sobre este producto. usa redacción profesional para eso

objetivo:

1. explora los 3 repositorios y redacta un subcapitulo (no debe ser tan extenso, ya que es más bien una sección) sobre el tech stack que usa cada uno de los 3 repositorios. actualmente tengo lo siguiente en mente:

```
Firebase para la autenticación y base de datos de todo el sistema

paralegales-services: microservicios, Event driven architecture, AWS Lambda, SQS, SNS, CloudFormation IaC, Cloduwatch, Twilio para enviar mensajes de whatsapp programaticamente, Deppsek API, API Gateway, ETL pipeline
paralegales-ui: Nuxt, vue.js, Zod, Vuetify, Playwright, Vitest, SSR
paralegales-admin: vue.js,
```

usa un modelo avanzado con suficiente ventana de contexto ya que tendra que explorar muchos archivos

## Resultado final

./1-subcapitulo-stack-tecnologico

## Arquitectura y Patrones de diseño

## Propmts

contexto: estoy creando el borrador el nuevo capítulo de mi proyecto de grado "Desarrollo del proyecto". sobre este producto. usa redacción profesional para eso

objetivo:

1. explora el repositorio de paralegales-ui y redacta un subcapitulo sobre la arquitectura a profundidad, todos los conceptos tecnicos, porque es importante, que problemas resuelve, es importante que resaltes que yo fui el encargado de proponer esa arquitectura en el proyecta y despues de ser aprobada fui el encargado de refactorizar el proyecto para adaptarla. actualmente tengo el siguiente texto de referencia que puedes usar como guia para llevar acabo la exploración


├── src/
│ ├── app-core/ # Core application code
│ │ ├── layouts/ # Global layouts
│ │ ├── middleware/ # Global middleware
│ │ ├── navigation/ # Navigation-related code
│ │ ├── plugins/ # Global plugins
│ │ └── public/ # Public assets
│ │
│ ├── common/ # Shared utilities and components
│ │ ├── components/ # Shared components
│ │ ├── stores/ # pinia or nuxt useState stores for global state
│ │ ├── models/ # Core domain models
│ │ ├── assets/ # images, etc.
│ │ ├── composables/ # Shared composables
| | ├── server/utils.ts # utils for BFF with nitro
│ │ └── utils/ # Shared utility functions
│ │
│ ├── features/ # Feature modules (Nuxt layers)
│ | ├── auth/ # Authentication feature
│ | │ ├── components/
│ | │ ├── composables/
│ | │ ├── pages/
│ | │ ├── services/
│ | │ ├── utils/
│ | │ └── nuxt.config.ts
│ | └── [other-features]/
│ |
| └── vendor/
| └── vuexy/ # Isolated theme layer, themeConfig.ts, etc.
|
└── // more config files...

````

# Key Architecture Desicions

## Feature-based Organization
Each feature is isolated in its own Nuxt layer, containing all related code including: Components, Pages, Services, Stores, Utils, Assets, feature-specific configuration `nuxt.config.ts` file, etc. In general any unit of code that is only used in the feature domain.

## Theme Isolation
The Vuexy theme is isolated in its own Nuxt layer (vendor/vuexy), which:
+ Contains all theme-specific code and configuration
+ Includes its own nuxt.config.ts
+ Keeps style variables and theme implementation details separate from application code
+ Prevents theme-specific code from being scattered throughout the application

# Benefits of This Approach

1. Enhanced Code Organization
   - Features are self-contained units
   - Related code stays together
   - Clear boundaries between different parts of the application
   - Easier to understand where code belongs

2. Improved Developer Experience
   - Less context switching between different parts of the codebase
   - Most work happens within a single feature directory
   - Faster navigation in IDE
   - Reduced cognitive load when working on features

3. Better Scalability
   - New features can be added without impacting existing ones
   - Easy to maintain as the codebase grows
   - Clear pattern for adding new functionality
   - Simpler onboarding for new team members

4. Enhanced Maintainability
   - Features can be modified or replaced independently
   - Reduced risk of unintended side effects
   - Easier to test and debug
   - Clear separation of concerns

5. Code Reusability
   - Shared code is clearly separated
   - Easier to identify reusable components
   - Reduced duplication

# Architectural Overview

## Domain-Driven Design (DDD)

Domain-Driven Design is a software development approach that focuses on modeling software to match a domain according to input from domain experts. The core principles include:

- Ubiquitous Language: Using a common language shared between developers and domain experts
- Bounded Contexts: Dividing a large domain into smaller, manageable contexts with clear boundaries
- Layered Architecture: Organizing code into distinct layers (presentation, application, domain, infrastructure)

## Our Architecture

Our application implements a hybrid approach that combines DDD concepts with the frontend-specific patterns of Nuxt 3:

### Layer Organization

- Features Layer (`/features/*`):
  - Represents distinct bounded contexts
  - Each feature is self-contained with its own components, services, and business logic
  - Aligns with DDD's concept of bounded contexts

- App Core Layer (`/src/app-core`):
  - Handles infrastructure concerns like layouts and global middleware, etc.
- Common Layer (`/src/common`):
  - Shared utilities and components
  - Represents reusable building blocks
  - Acts as a shared kernel in DDD terms

- Vendor Layer (`/vendor`):
  - External dependencies and themes
  - Clearly separated from domain logic
  - Follows DDD's principle of isolating external concerns

This hybrid approach allows us to maintain the benefits of DDD (clear boundaries, domain focus, maintainability) while leveraging the strengths of modern frontend development patterns.

# Resources

1. https://davestewart.co.uk/blog/nuxt-layers/
2. https://krutiepatel.com/blog/nuxt-layers-unwrapped
3. https://nuxt.com/docs/getting-started/layers
4. https://youtu.be/I2zyFp1OtDA?si=emPDbVJbOtxXmCxJ
5. https://www.maxpou.fr/blog/3-tips-scaling-vue-application/

````

2. explora el repositorio paralegales-services. ya que en ese repo fui el encargado de proponer y refactorizar algunas funciones lambdas para que adoptara la separanción de handler + struct de service y abstract repository pattern (generic interface + actual implementation). explica que ademas esto fue importante ya que en un inicio y tal como lo expone este trabajo de grado el objetivo era migrar nuestra base de datos de Firestore a AWS Dynamo DB. al final esto no se llevo acabo por las desiciones empresariales y de producto, pero fue un paso importante que de caulquier manera ayudo a la legibilidad, mantenibilidad del codigo, siendo util además para permitir usar test unitarios mockeando por ejemplo el struct del repository. por ejemplo la lambda: paralegales-services/functions/tracking/checkProcesses/ usa este patron

con la infromación de el paso 1 y 2 redacta este subcapitulo que aborde este tema a profundidad y explique como estuve embuelto en el proceso

usa un modelo avanzado con suficiente ventana de contexto ya que tendra que explorar muchos archivos


## Resultado

./2-arquitectura-y-refactorizaciones.md

# Modulo de Autenticación
## Propmts

contexto: estoy creando el borrador el nuevo capítulo de mi proyecto de grado "Desarrollo del proyecto". sobre este producto. usa redacción profesional para eso

objetivo:

1. explora el modulo de autenticación y readacta un capitulo sobre las funcionalidades implementadas es importante que filtres solo por lo que implemente ya que otras personas también participaron en este proyecto. yo trabaje en: (login, register, login con google todo atraves de firebase, verificación del correo del usuario). adicionalmente podrías usar comandos git para filtrar por mi usuario jfmonsa o correo juanmonsalve@protonmail.com juan.felipe.monsalve@correounivalle.edu.co

es importante hablar sobre las vistas, los componentes principales a nivel de software, la interacción backend frontend. el formato debe ser redacción profesional de parrafos al nivel de un trabajo de grado






# Propmt
contexto: estoy creando el borrador el nuevo capítulo de mi proyecto de grado "Desarrollo del proyecto". sobre este producto. usa redacción profesional para eso

objetivo:

modifica la redacion de @contextScopeItemMentionpara incluir que también se desarolló la funcion de recuperación de contraseña, encuesta de onboarding, funcionalidades para actualizar email y contraseña desde la pagina de perfil de usuario

para esto explora primero en los siguientes archivos relacionados
1 cambio de clave ycontraseña: @contextScopeItemMention

2 restablecer cotraseña: @contextScopeItemMention

3 onboarding: surveys @contextScopeItemMention

create a plan first exploring related files to the ones i attached relevant to this features