defmodule Circle do
  @moduledoc "Implements basic circle functions"
  # Define a module attribute
  @pi 3.1459

  @doc "Computes the area of a circle"
  # @spec is type specification allows to provide type information for functions
  @spec area(number) :: number
  def area(r), do: r * r * @pi # Use a module attribute

  @doc "Computes the circumference of a circle"
  # @spec is type specification allows to provide type information for functions
  @spec circumference(number) :: number
  def circumference(r), do: 2 * r * @pi

end
