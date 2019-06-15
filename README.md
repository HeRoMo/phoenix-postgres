# Docker Compose of Phoenix Framework

Docker Compose of Phoenix Framework for development.

- Elixir 1.8
- Node.js 12.4
- PostgreSQL 10.7

## Usage

### Using `docker-compose`, directly
#### Install Phoenix
```console
$ docker-compose up -d
$ docker-compose run --rm phoenix mix phx.new <app name>
```

#### Modify database hostname

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

#### Start Dev Server

```console
$ docker-compose up -d
$ docker-compose exec phoenix /bin/bash
/app# cd <app name>
/app# mix ecto.create
/app# mix phx.server
```

Open http://localhost:4000 in your browser

### Using VS Code with Remote - Containers extension

You can use VS Code and [Remote \- Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.

1. Start VS Code and click on the quick actions Status Bar item of Remote extension in the lower left corner.
2. Select Remote-Containers: Open Folder in Container... from the command list that appears, and open the root folder of the project you just cloned.
3. Select *docker-compose.yml* and *phoenix* service.
4. Execute the following commads in the terminal.

```console
$ mix phx.new <app name>
```

Change `hostname` in *<app name>/config/dev.exs* to `postgres`

```console
# cd <app name>
# mix ecto.create
# mix phx.server
```

Open http://localhost:4000 in your browser

## LICENSE

[MIT](LICENSE)
