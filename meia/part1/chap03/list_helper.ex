defmodule ListHelper do
  # Iterating with recursion

  def sum([]), do: 0
  # Potential problem: consume the entire memory because of recursion
  def sum([head | tail]), do: head + sum(tail)

  def sum_list(list), do: 0 |> do_sum(list)

  # ===============================================
  # Use tail call
  defp do_sum(current_sum, []) do
    current_sum
  end

  # Use tail call
  defp do_sum(current_sum, [head | tail]), do: (head + current_sum) |> do_sum(tail)

  # ===============================================
  def list_len(list), do: 0 |> list_len(list)
  defp list_len(cnt, []), do: cnt
  defp list_len(cnt, [_ | tail]), do: (1 + cnt) |> list_len(tail)

  def range(from, to) when is_number(from) and is_number(to) and from <= to,
    do: [] |> range(from, to)

  defp range(list, from, to) when from === to, do: [from | list]
  defp range(list, from, to) when to > from, do: [to | list] |> range(from, to - 1)

  def positive(list), do: list |> positive([])
  def positive([], result), do: result

  def positive([head | tail], result) do
    case head > 0 do
      true -> tail |> positive([head | result])
      _ -> tail |> positive(result)
    end
  end

  # ===============================================
  def sum_reduce(list) do
    Enum.reduce(list, 0, fn element, accumulator ->
      accumulator + element
    end)
  end

  def sum_reduce(list), do: Enum.reduce(list, 0, &+/2)
end
