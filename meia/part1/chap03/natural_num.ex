defmodule NaturalNum do
  def print(1), do: IO.puts(1)

  def print(n) when n > 0 do
    print(n - 1)
    IO.puts(n)
  end
end
