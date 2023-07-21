defmodule Calculator do
  # import allows to call its public functions without prefix the module name
  import IO

  # alias to reference a module under a different name
  alias Geometry, as: Geo # Geometry => Geo

  # Default value for argument (if not specify when call funtion): \\ 0
  def sum(a, b \\ 0), do: a + b

  def invoke_priv_func, do: private_func()

  def cal_area(a, b), do: Geo.rectangle_area(a, b) # invoke function use alias name

  # use defp to define private function
  defp private_func do
    # IO.puts("Private function") // if don't have import
    puts("Private function")
  end
end
