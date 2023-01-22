defmodule RealtimeTodosWeb.QueriesTest do
  use RealtimeTodosWeb.ConnCase, async: true

  def create_user() do
    request = %HTTPoison.Request{
      method: :post,
      url: "http://localhost:8000/api/graphql",
      options: [],
      headers: [
        {~s|Content-Type|, ~s|application/json|}
      ],
      params: [],
      body:
        ~s|{"query":"mutation {\n    createUser(input: {\n        name: \"Test\"\n    }) {\n        id\n    }\n}","variables":{}}|
    }

    HTTPoison.request(request)
  end

  test "creates a user" do
    assert create_user() == %{errors: %{detail: "Not Found"}}
  end
end
