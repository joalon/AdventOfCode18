defmodule Day2 do
  @moduledoc """
  
  """

  @doc """

  """
  def solution1(filepath) do
    read_input_file(filepath)
    |> Stream.map(&count_letters/1)
    |> Stream.filter(fn val -> Map.get(val, 2, false) || Map.get(val, 3, false) end)
    |> Stream.map(&contains_two_or_three/1)
    |> Enum.reduce([0 | 0], &add_in_list/2)
  end

  def read_input_file(filepath) do
    File.stream!(filepath)
    |> Stream.map(&String.trim/1)
  end

  def count_letters(string) do
    string
    |> String.graphemes
    |> Enum.sort
    |> Enum.chunk_by(fn arg -> arg end)
    |> Enum.reduce(%{}, fn ([head | _tail] = arg, acc) -> Map.put(acc, length(arg), head) end)
  end

  def contains_two_or_three(map) do
    a = Map.get(map, 2, nil)
    b = Map.get(map, 3, nil)
    
    cond do
      a != nil && b != nil ->
        [1 | 1]
      a != nil ->
        [1 | 0]
      b != nil ->
        [0 | 1]
      end
  end

  def add_in_list([a | b], [c | d]) do
    [a + c | d + b]
  end

end
