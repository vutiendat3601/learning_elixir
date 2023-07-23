defmodule TestNum do
  # Using guards (when ...)

  def test(x) when is_number(x) and x < 0, do: :negative

  def test(0), do: :zero

  def test(x) when is_number(x), do: :positive
end
