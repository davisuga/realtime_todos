import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :realtime_todos, RealtimeTodos.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "realtime_todos_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :realtime_todos, RealtimeTodosWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "6fbKVzAWxx0B2k0NCxTTt8tWf7NgO5opEmz4UlODn/9+vyS5unKw8MJEfB2FzYvh",
  server: false

# In test we don't send emails.
config :realtime_todos, RealtimeTodos.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
