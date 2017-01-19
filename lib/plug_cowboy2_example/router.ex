defmodule PlugCowboy2Example.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  match _ do
    case conn.adapter do
      {_, %{version: :"HTTP/2"}} ->
        send_resp(conn, 200, "<h1 style=\"color: green\">You are using HTTP/2!</h1>")
      _ ->
        send_resp(conn, 200, "<h1 style=\"color: red\">You are not using HTTP/2!</h1>")
    end
  end
end
