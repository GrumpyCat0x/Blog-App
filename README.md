# Blog App

This is a Ruby on Rails blog application that allows users to create, read, update, and delete blog posts. It is structured as a standard Rails app and includes automated checks for code quality, security, and tests via GitHub Actions.

## Features

- Blog posts with full CRUD functionality
- Rails MVC structure under `app/`:
  - `app/models` for domain logic
  - `app/controllers` for request handling
  - `app/views` for HTML rendering
  - `app/jobs`, `app/mailers`, `app/helpers`, and `app/javascript` for background work, emails, helpers, and front‑end code
- Asset management and precompilation
- System tests with screenshot capture on failure

## Development

- Ruby and Rails dependencies are managed via `Gemfile`
- Database configuration and environment settings live under `config/`
- Database migrations are in `db/`
- Local scripts and tooling are under `bin/` and `script/`

Run basic development commands:

```sh
bin/setup        # initial setup (if present)
bin/rails s      # start the server
bin/rails db:migrate
bin/rails test   # run tests
```

## CI / CD

GitHub Actions workflows are defined in [`.github/workflows/ci.yml`](.github/workflows/ci.yml) and include:

- Ruby security scan with Brakeman
- JavaScript dependency security scan using Importmap audit
- Linting with RuboCop
- Test job that:
  - Installs system dependencies (including Google Chrome for system tests)
  - Prepares the test database
  - Runs unit and system tests
  - Uploads screenshots from failed system tests as artifacts

## Deployment

The project includes [`.kamal/`](.kamal) configuration for deployment (using the Kamal deployment tool) and a `Dockerfile` and `.dockerignore` for containerized builds.

```# Blog App

This is a Ruby on Rails blog application that allows users to create, read, update, and delete blog posts. It is structured as a standard Rails app and includes automated checks for code quality, security, and tests via GitHub Actions.

## Features

- Blog posts with full CRUD functionality
- Rails MVC structure under `app/`:
  - `app/models` for domain logic
  - `app/controllers` for request handling
  - `app/views` for HTML rendering
  - `app/jobs`, `app/mailers`, `app/helpers`, and `app/javascript` for background work, emails, helpers, and front‑end code
- Asset management and precompilation
- System tests with screenshot capture on failure

## Development

- Ruby and Rails dependencies are managed via `Gemfile`
- Database configuration and environment settings live under `config/`
- Database migrations are in `db/`
- Local scripts and tooling are under `bin/` and `script/`

Run basic development commands:

```sh
bin/setup        # initial setup (if present)
bin/rails s      # start the server
bin/rails db:migrate
bin/rails test   # run tests
```

## CI / CD

GitHub Actions workflows are defined in [`.github/workflows/ci.yml`](.github/workflows/ci.yml) and include:

- Ruby security scan with Brakeman
- JavaScript dependency security scan using Importmap audit
- Linting with RuboCop
- Test job that:
  - Installs system dependencies (including Google Chrome for system tests)
  - Prepares the test database
  - Runs unit and system tests
  - Uploads screenshots from failed system tests as artifacts

## Deployment

The project includes [`.kamal/`](.kamal) configuration for deployment (using the Kamal deployment tool) and a `Dockerfile` and `.dockerignore` for containerized builds.
