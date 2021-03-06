use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :blog, Blog.Endpoint,
  secret_key_base: "dlhMj/jrATJW7/XQ3FvFjHuw2qKilr+Usb44Fyr5ztCi0EROrlf47/xLtE1gYuVo"

# Configure your database
config :blog, Blog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "blog_prod",
  pool_size: 20
