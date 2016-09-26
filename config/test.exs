use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :eventil_agenda, EventilAgenda.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :eventil_agenda, EventilAgenda.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "kasiakasprzak",
  password: "",
  database: "eventdrom_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
