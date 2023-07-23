defmodule Math do
  def fact(0), do: 1
  def fact(x) when is_number(x) and x > 0, do: x * fact(x - 1)

  # Use "cond" control flow
  def max_cond(a, b) do
    cond do
      a >= b -> a
      # default matches
      true -> b
    end
  end

  # Use "case" control flow
  def max_case(a, b) do
    case a >= b do
      true ->
        a

      false ->
        b
        # _ ->
    end
  end

  def multiple_table do
    # Map interpret {{x, y}, x * y}
    for x <- 1..3, y <- 1..3, x < y, into: %{}, do: {{x, y}, x * y}
  end
end
