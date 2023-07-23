defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new()

  def new(entries \\ []), do: Enum.reduce(entries, %TodoList{}, &add_entry(&2, &1))

  def add_entry(
        %TodoList{entries: entries, auto_id: auto_id} = todo_list,
        %{date: {_, _, _}, title: _} = entry
      ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)
    %TodoList{todo_list | entries: new_entries, auto_id: auto_id + 1}
  end

  def entries(%TodoList{entries: todo_entries}, {year, month, day}) do
    todo_entries
    |> Stream.filter(fn {_, %{date: e_date}} -> e_date == {year, month, day} end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, updater_func) do
    case entries[entry_id] do
      nil ->
        todo_list

      old_entry ->
        old_entry_id = old_entry[:id]
        new_entry = %{id: ^old_entry_id} = updater_func.(old_entry)
        new_entries = Map.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(%TodoList{entries: entries} = todo_list, entry_id) do
    %TodoList{todo_list | entries: Map.delete(entries, entry_id)}
  end
end

defmodule TodoList.CsvImporter do

  def import(path) do
    File.stream!(path)
    |> Stream.map(&String.split(String.replace(&1, "\n", ""), ","))
    |> Stream.map(fn [head | tail] ->
      date = Enum.reduce(String.split(head, "/"), {}, &Tuple.append(&2, String.to_integer(&1)))

      %{
        date: date,
        title:
          case Enum.empty?(tail) do
            true -> ""
            false -> hd(tail)
          end
      }
    end)
    |> Enum.to_list()
    |> TodoList.new()
  end
end
