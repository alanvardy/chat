# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

config :chat, ChatWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :chat, Chat.Repo,
username: "postgres",
password: "postgres",
database: "chatdb",
url: database_url,
pool_size: 15