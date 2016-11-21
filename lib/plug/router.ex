defmodule ExEcho.Plug.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Hello World")

  get "/echo/*path" do
    conn
    |> merge_resp_headers(conn.req_headers)
    |> send_resp(200, path)
  end

  post "/echo/*path" do
    req_headers = conn.req_headers
    {:ok, req_body, conn} = read_body(conn)
    conn
      |> merge_resp_headers(req_headers)
      |> put_resp_header("origin-path", Enum.join(path, "/"))
      |> resp(200, req_body)
      |> send_resp
  end

  match _, do: send_resp(conn, 404, "Not found")
end
