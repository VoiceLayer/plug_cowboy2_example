defmodule PlugCowboy2Example do
  use Application
  require Logger

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    priv_dir = Path.join(Application.app_dir(:plug_cowboy2_example), "priv")
    certfile = Path.join(priv_dir, "server.pem")
    keyfile = Path.join(priv_dir, "server.key")

    unless File.exists?(keyfile) do
      raise """
      No SSL key/cert found. Please run the following command:

      openssl req -new -newkey rsa:4096 -days 365 -nodes -x509  \
      -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
      -keyout priv/server.key -out priv/server.pem
      """
    end

    children = [
      {Plug.Adapters.Cowboy2, scheme: :https, plug: PlugCowboy2Example.Router,
        options: [port: 4001, certfile: certfile, keyfile: keyfile]},
      {Plug.Adapters.Cowboy2, scheme: :http, plug: PlugCowboy2Example.Router,
        options: [port: 4002]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options

    opts = [strategy: :one_for_one, name: PlugCowboy2Example.Supervisor]

    {:ok, pid} = Supervisor.start_link(children, opts)

    Logger.info("""
    Running on https://localhost:4001/ \
    Please note you will need to accept the self-signed certificate
    """)

    Logger.info("""
    Running on http://localhost:4002/ This version will only work with a client \
    that supports HTTP/2 without HTTPS (most browsers require HTTPS)
    """)

    {:ok, pid}
  end
end

