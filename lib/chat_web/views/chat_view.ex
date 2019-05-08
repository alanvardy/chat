defmodule ChatWeb.ChatView do
  use ChatWeb, :view

  def nice_date(datetime) do
    {:ok, result} =
      datetime
      |> Timex.Timezone.convert("America/Edmonton")
      |> Timex.format("{h24}:{m}:{s}")

    result
  end
end
