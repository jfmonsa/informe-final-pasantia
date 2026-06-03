# Informe Final de Pasantía

Este repositorio contiene el código fuente LaTex de mi informe final de pasantía "_Migración de la infraestructura de Firebase a AWS en Paralegales_"

---

**Resumen**:

> (...)

> (...)

> El presente proyecto tiene como objetivo principal migrar y adaptar la infraestructura tecnológica de Paralegales desde Firebase hacia un entorno 100\% en AWS (Amazon Web Services). Esta migración busca mejorar la seguridad del sistema, aumentar la escalabilidad y reducir los costos operativos, además de permitir trasladar lógica de negocio sensible actualmente implementada en el _frontend_ hacia entornos seguros como AWS Lambda.

**Key Words**: Ingeniería de software, Microservicios, Enterprise migration, Cloud computing, APIs, Vendor lock-in, Legaltech.

---

## Get Started

Este repo se ha modernizado para utilizar contenedores Docker, lo que simplifica el manejo de dependencias y asegura un entorno reproducible para cualquier colaborador. 

Las herramientas incluidas en el contenedor son:
1. **TinyTex**: Motor LaTeX ligero.
2. **tex-fmt**: Formateador de código TeX (escrito en Rust).
3. **Make**: Para ejecutar comandos comunes (reemplaza a Taskfile).
4. **Dependencias y Paquetes LaTeX**: Preinstalados según `latex-packages.txt`.

### Opción 1: Usando VS Code Dev Containers (Recomendado)

Esta es la forma más fácil y *Plug-and-Play* de trabajar en el proyecto. 

1. Asegúrate de tener instalado [Docker](https://docs.docker.com/get-docker/) y [Visual Studio Code](https://code.visualstudio.com/).
2. Instala la extensión de VS Code: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3. Abre este repositorio en VS Code. 
4. Aparecerá un cuadro de diálogo en la esquina inferior derecha preguntando si quieres "Reabrir en un Contenedor" (Reopen in Container). Haz clic en él.
   *(Alternativa: Abre la paleta de comandos con `Ctrl+Shift+P` y busca "Dev Containers: Reopen in Container")*.

Una vez cargado, VS Code instalará y configurará automáticamente la extensión de **LaTeX Workshop**, **Spell Checker**, el formateador `tex-fmt` y todo estará listo para compilar automáticamente.

### Opción 2: Usando Docker Compose (Desde la Consola)

Si prefieres usar otro editor o solo la consola, puedes usar `docker-compose`.

1. Para inicializar el contenedor interactivo o ejecutar comandos (ejemplo con `make compile`):
   ```sh
   docker compose run --rm latex-dev make compile
   ```
2. Para entrar a la consola del contenedor y trabajar desde allí:
   ```sh
   docker compose run --rm latex-dev /bin/bash
   ```

*(Nota: Los archivos antiguos de instalación local directa aún se conservan en la carpeta `scripts/` como referencia histórica o para instalación sin Docker, pero se recomienda encarecidamente la ruta de Docker).*
