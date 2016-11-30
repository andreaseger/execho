# ExEcho

Simple echo server powered by plug and cowboy.

## Installation

```sh
mix deps.get

# run tests
mix test

# run with shell
iex -S mix

# try running :observer.start inside the shell to monitor the node

# run
mix run --no-halt


#production
env MIX_ENV=prod mix compile
env MIX_ENV=prod mix compile.protocols
env MIX_ENV=prod elixir -pa _build/prod/consolidated -S mix run --no-halt
```

### Release

- init distillery via `mix distillery.init`
- look into `rel/config.exs`
- create release via `env MIX_ENV=prod mix release --env=prod`
- find tarbal in `rel/ex_echo/releases/<version>/ex_echo.tar.gz`
- move it onto server, extract and start via `bin/ex_echo start`
- more info: https://hexdocs.pm/distillery/walkthrough.html#content

## Meta

Playground app
