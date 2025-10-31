# Curso Karate — Tests API (Proyecto)

[![CI - Karate Tests (main)](https://github.com/daniloerj/karate-octubre-test/actions/workflows/karate-ci.yml/badge.svg?branch=main)](https://github.com/daniloerj/karate-octubre-test/actions/workflows/karate-ci.yml)
[![CI - Karate Tests (develop)](https://github.com/daniloerj/karate-octubre-test/actions/workflows/karate-ci.yml/badge.svg?branch=develop)](https://github.com/daniloerj/karate-octubre-test/actions/workflows/karate-ci.yml)

[Sitio de reportes (GitHub Pages): https://daniloerj.github.io/karate-octubre-test/]

Descripción
-----------
Proyecto de ejemplo para ejecutar pruebas API con Karate (framework de testing basado en Cucumber/Gherkin). Contiene escenarios para endpoints de ejemplo (comments, users, posts), esquemas JSON y datos de prueba.

Estado: prueba / ejemplo — adaptalo a tu API real según convenga.

Requisitos
----------
- macOS / Linux / Windows (los comandos de ejemplo usan zsh / bash)
- Java JDK 17+ (o la versión que use tu proyecto)
- Maven 3.6+
- Conexión a Internet para ejecutar pruebas contra APIs públicas (si aplicable)

Estructura principal del repositorio
-----------------------------------
- `pom.xml` — configuración Maven y dependencias (Karate)
- `src/test/java/examples/` — features de Karate (Gherkin)
- `src/test/java/schemas/` — esquemas JSON usados en validaciones
- `src/test/java/testdata/` — datos de prueba (ej. `users.json`)
- `target/` — salida de compilación, reportes y artefactos generados
  - `target/karate-reports/` — reportes HTML generados por Karate

Cómo ejecutar las pruebas
-------------------------
Desde la raíz del proyecto, puedes ejecutar todas las pruebas con Maven:

```bash
mvn test
```

Ejecutar sólo las pruebas con una etiqueta (tag) concreta, por ejemplo `@comments`:

```bash
mvn test "-Dkarate.options=--tags @comments"
```

Ejecutar una feature específica (ruta relativa del classpath):

```bash
mvn test "-Dkarate.options=classpath:examples/comments/comments.feature"
```

Pasar `karate.env` para configurar entornos (ejemplo `qa`, `staging`):

```bash
mvn test -Dkarate.env=qa
```

Salida y reportes
-----------------
- Reporte HTML generado: `target/karate-reports/karate-summary.html`.
  Abre el archivo en tu navegador para ver resultados y detalles.
- Reportes históricos y recursos estáticos se guardan en `target/karate-reports*/res/`.

Integración continua (CI) y GitHub Actions
-----------------------------------------
Este proyecto incluye un workflow de GitHub Actions (`.github/workflows/karate-ci.yml`) que:

- Ejecuta las pruebas con `mvn test` cuando se crea un Pull Request hacia las ramas `develop` o `main`.
- Puede ejecutarse manualmente desde la pestaña "Actions" (`workflow_dispatch`).
- Genera los reportes HTML de Karate y los despliega en GitHub Pages (URL estimada):
  https://daniloerj.github.io/karate-octubre-test/

Notas:
- Para PRs desde forks, la publicación en Pages puede estar limitada por permisos del `GITHUB_TOKEN`.
- Puedes forzar una ejecución manual desde Actions > CI - Karate Tests > Run workflow.


Datos de prueba
---------------
Los datos de prueba se encuentran en `src/test/java/testdata/`.
Ejemplos de uso desde un feature de Karate:

```karate
* def users = read('classpath:testdata/users.json')
* def newUser = users.newUser
```

Buenas prácticas y consejos
---------------------------
- Mantén `testdata/` separado de las features para facilitar la reutilización.
- Versiona sólo los datos necesarios: evita incluir credenciales en ficheros versionados. Usa variables de entorno o mecanismos de vault para secretos.
- Añade `@smoke`, `@regression` u otras etiquetas para ejecutar subconjuntos de pruebas por CI.
- Para pruebas locales, usa `-Dkarate.env=local` y define los endpoints/credenciales en `karate-config.js`.

Contribuir
----------
1. Crea un branch a partir de `main` (o rama principal).
2. Añade tests o cambia datos en `src/test/java/` según el alcance.
3. Ejecuta `mvn test` localmente antes de crear el PR.
4. Abre un Pull Request con descripción clara de los cambios.

Archivos útiles
---------------
- `src/test/java/karate-config.js` — configuración y variables de entorno de Karate
- `src/test/java/testdata/` — datos JSON usados por los tests
- `src/test/java/schemas/` — esquemas JSON para validaciones

Ignorar archivos generados
-------------------------
Este repositorio contiene un `.gitignore` con reglas para Maven, IDEs y macOS. Asegúrate de revisar `/.gitignore` si necesitas versionar algún artefacto (por ejemplo reportes específicos).

Contacto
--------
- Equipo de QA / autor: agrega aquí tu correo o enlace a Slack/Teams (opcional)

Licencia
--------
Añade aquí la licencia apropiada (por ejemplo MIT, Apache-2.0) si corresponde.
