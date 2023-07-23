defmodule FileHelper do
  def num_of_lines({:ok, contents}), do: contents |> String.split(contents) |> length

  def num_of_lines(_error), do: {:error, "Can't read file!"}

  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  # lines_lengths!/1 that takes a file path and returns a list of numbers,
  # with each number representing the length of the corresponding line from the file.
  def lines_lengths!(path) do
    path
    |> File.stream!()
    |> Stream.with_index()
    # |> Stream.map(fn {content, index} -> "#{index + 1}: #{String.length(content) - 1}" end)
    |> Stream.map(&"#{elem(&1, 1) + 1}: #{String.length(elem(&1, 0)) - 1}")
    |> Enum.to_list()
  end

  # longest_line_length!/1 that returns the length of the longest line in a file
  def longest_line_length!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.length(&1))
    |> Enum.reduce(0, &if(&1 > &2, do: &1, else: &2))
  end

  # longest_line!/1 that returns the contents of the longest line in a file.
  def longest_line!(path) do
    path
    |> File.stream!()
    |> Enum.reduce("", &if(String.length(&1) > String.length(&2), do: &1, else: &2))
  end

  # words_per_line!/1 that returns a list of numbers,
  # with each number representing the word count in a file.
  def words_per_line(path) do
    path
    |> File.stream!()
    |> Stream.map(&length(String.split(&1)))
    |> Enum.to_list()
  end
end
