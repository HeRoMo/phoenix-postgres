# Docker Compose of Phoenix Framework

Docker Compose of Phoenix Framework for development.

- Elixir 1.8
- Node.js 12.4
- Postgres 10.7

## Usage

### Install Phoenix
```console
$ docker-compose up -d
$ docker-compose run --rm phoenix mix phx.new <app name>
```

### Modify database host

Change hostname in *<app name>/config/dev.exs*

```diff
config :<app name>, Hello.Repo,
  username: "postgres",
  password: "postgres",
  database: "<app name>_dev",
  - hostname: "localhost",
  + hostname: "postgres",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

### Start Dev Server

```console
$ docker-compose up -d
$ docker-compose exec phoenix /bin/bash
/app# cd <app name>
/app# mix ecto.create
/app# mix phx.server
```

Open http://localhost:4000 in your browser

## LICENSE

[MIT](LICENSE)
