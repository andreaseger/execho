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

## Meta

Playground app
