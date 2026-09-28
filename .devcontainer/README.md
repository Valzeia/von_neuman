# Dev container

Linux container for C# / Unity project work, with Git, the VS Code server, and PostgreSQL.

## What is inside

| Piece | Where |
| --- | --- |
| VS Code | Host UI. The container installs the VS Code server and the C# / Unity extensions when you reopen in the container. |
| Git | Installed in the image and refreshed by the `git` feature. |
| .NET 8 SDK | Matches the Unity 6 scripting runtime. Used for language services, not for launching the editor. |
| PostgreSQL 16 | Compose service `db`. From inside the container it is `localhost:5432`. |

Connection (local development only):

- host: `localhost`
- port: `5432`
- database: `von_neuman`
- user: `postgres`
- password: `postgres`

## Unity Editor

The Unity Editor is not installed in this container. It needs a GPU, a display, and a host license, and the official `unityci/editor` images are headless CI images rather than an interactive VS Code environment.

Use the editor on the host and this container for scripts, Git, and the database:

1. Install the same Unity version on the host and open the project there.
2. In VS Code, run **Dev Containers: Reopen in Container**.
3. Edit C# under `Assets/` from the container. The repo is bind-mounted, so the host editor sees the same files.
4. Let the host editor compile and enter Play Mode.

If you later pin a Unity version, set `m_EditorVersion` in `ProjectSettings/ProjectVersion.txt` and keep the host editor on that version.

## Start

Requires Docker and the Dev Containers extension.

```text
Dev Containers: Reopen in Container
```

Postgres data persists in the `postgres-data` volume. `initdb/01-init.sql` runs only when that volume is first created.
