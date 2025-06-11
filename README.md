<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]

# Project

Short project description

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Code-Style](#code-style)
- [Getting Started](#getting-started)
  - [Prerequisties](#prerequisties)
  - [Initialize repository](#initialize-repository)
- [Configuration](#configuration)
  - [Preparation](#preparation)
- [Development](#development)
  - [Running npm commands in Docker](#running-npm-commands-in-docker)
  - [Code Quality: pre-commit hooks](#code-quality-pre-commit-hooks)
  - [Running npx commands in Docker](#running-npx-commands-in-docker)
- [Known Issues](#known-issues)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## Code-Style

<!-- TBD -->

## Getting Started

### Prerequisties

- [pre-commit][pre-commit]
- [yamllint][yamllint]

### Initialize repository

Pre-commit framework need to get initialized.

```console
task pre-commit:init
```

## Configuration

### Preparation

All changes require a PR and review. Create a new branch and reference a Jira ticket, f.e.

```console
git switch -c feature/INPRO-1-configure-resource
```

## Development

### Running npm commands in Docker

All npm commands are run inside a Docker container using the Node.js version specified in `.nvmrc`. This ensures consistency across environments.

#### Basic usage

```bash
task npm -- <npm_command> [<args>]
```

#### Common tasks

- **Start the dev environment (Vite on port 5173):**

  ```bash
  task npm:dev
  # or
  task npm -- run dev
  ```

  Access at: <http://localhost:5173>

- **Start Storybook (port 6006):**

  ```bash
  task npm:storybook
  # or
  task npm -- run storybook
  ```

  Access at: <http://localhost:6006>

- **Run tests:**

  ```bash
  task npm:test
  # or
  task npm -- run test
  ```

- **Update snapshots:**

  ```bash
  task npm:test:update
  # or
  task npm -- run test:update
  ```

- **Build for production:**

  ```bash
  task npm:build
  # or
  task npm -- run build
  ```

- **Lint with ESLint:**

  ```bash
  task npm:lint
  # or
  task npm -- run lint
  ```

- **Type-check:**

  ```bash
  task npm:type-check
  # or
  task npm -- run type-check
  ```

#### Arbitrary npm commands

You can run any npm command using:

```bash
task npm -- <command> [args]
```

For mapped npm tasks (see below), you can also use:

```bash
task npm:<command>
```

Examples:

```bash
# List installed packages
task npm -- ls
# Only works if a mapped task exists:
task npm:ls

# Run a custom script
task npm -- run <script>
# Only works if a mapped task exists:
task npm:run -- <script>
```

> **Note:** Only mapped npm commands (those defined in the Taskfile) support the `task npm:<command>` syntax. For all other npm commands, use `task npm -- <command> [args]`.

---

### Code Quality: pre-commit hooks

To check and auto-fix code style and quality using pre-commit hooks, use:

```bash
task pre-commit:run
```

This will run all configured pre-commit hooks (such as linting, formatting, etc.) on your codebase. It ensures your code meets the project's quality standards before committing.

---

### Running npx commands in Docker

To run npx commands inside Docker:

```bash
task npx -- <npx_command> [<args>]
```

Example (upgrade Storybook):

```bash
task npx -- storybook@latest upgrade
```

Other Storybook npx commands:

```bash
task npx -- storybook automigrate
task npx -- storybook doctor
```

---

These tasks ensure all npm/npx commands run in a consistent Docker environment with the correct Node.js version.

## Known Issues

<!-- TBD -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[pre-commit]: https://pre-commit.com/
[yamllint]: https://github.com/adrienverge/yamllint

<!-- Badges -->

[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/Taskfile-Enabled-brightgreen?logo=task
