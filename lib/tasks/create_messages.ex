defmodule Mix.Tasks.CreateMessages do
  use Mix.Task

  def run(_) do
    {:ok, _} = Application.ensure_all_started(:hackney)
    {:ok, _} = Application.ensure_all_started(:ex_aws)

    Task.async_stream(1..10_000, fn item ->
      ExAws.SQS.send_message("test_queue", "yo #{item}")
      |> ExAws.request()
    end)
    |> Enum.all?(fn item -> elem(item, 0) == :ok end)
    |> IO.inspect()
  end
end
