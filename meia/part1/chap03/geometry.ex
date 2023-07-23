defmodule Geometry do
  @pi 3.14

  # Multiclause function ~ Overload

  def area({:retangle, a, b}), do: a * b

  def area({:square, a}), do: a * a

  def area({:circle, r}), do: r * r * @pi

  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end
