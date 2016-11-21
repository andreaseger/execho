defmodule RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias ExEcho.Plug.Router

  @opts Router.init([])

  test "returns Hello World" do
    conn = conn(:get, "/", "") |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello World"
  end

  test "echos headers" do
    conn = conn(:get, "/echo/some_path")
      |> put_req_header("some_header", "with value")
      |> Router.call(@opts)

    assert conn.status == 200
    assert conn.resp_body == "some_path"
    assert conn.resp_headers == [{"cache-control", "max-age=0, private, must-revalidate"},{"some_header", "with value"}]
  end

  test "echo everything" do
    body = "some body"
    conn = conn(:post, "/echo/foo/bar/baz", body)
      |> put_req_header("special-header", "foooo")
      |> Router.call(@opts)

    assert conn.status == 200
    assert conn.resp_body == body
    assert conn.resp_headers == [
      {"cache-control", "max-age=0, private, must-revalidate"},
      {"special-header", "foooo"},
      {"origin-path", "foo/bar/baz"}
    ]
  end

  test "unknown route" do
    conn = conn(:get, "/unknown") |> Router.call(@opts)

    assert conn.status == 404
    assert conn.resp_body == "Not found"
  end
end
