defmodule ExEcho.Plug.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Hello World")

  get "/echo/*path" do
    conn
    |> merge_resp_headers(conn.req_headers)
    |> put_resp_header("query-string", conn.query_string)
    |> send_resp(200, Enum.join(path, "/"))
  end

  post "/echo/*path" do
    {:ok, req_body, conn} = read_body(conn)
    conn
      |> merge_resp_headers(conn.req_headers)
      |> put_resp_header("origin-path", Enum.join(path, "/"))
      |> send_resp(200, req_body)
  end

  match _, do: send_resp(conn, 404, "Not found")
end
