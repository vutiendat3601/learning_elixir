# A module is a collection of functions, something like a namespace
# Every Elixir function must be defined inside a module.
defmodule Geometry do
  # A function must always be a part of a module.
  # rectangle_area/2 => arity of function is 2 (a, b)
  def rectangle_area(a, b), do: a * b

  def square_area(a) do
    # Call to a function in the same module
    # Pipeline operator |> places the result of the previous call
    # as the first argument of the next call
    a
    |> rectangle_area(a)
  end
end
