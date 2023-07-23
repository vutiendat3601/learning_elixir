defmodule Number do
  # Loops use the recursion

  def print(1), do: IO.puts(1)

  def print(n) when is_number(n) do
    print(n - 1)
    IO.puts(n)
  end
end
