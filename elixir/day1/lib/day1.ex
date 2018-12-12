defmodule Day1 do
  @moduledoc """
  This is day one of the advent of code.

  Problem 1: Read a file of integers and return the sum
  Problem 2: Find the first sum which appears twice
  """

  @doc """
  Sums the parsed input from the filepath

  Returns the sum of integers in the file
  """
  def solution1(filepath) do
    read_input_file(filepath)
    |> Enum.sum
  end

  @doc """
  For each line in input file, add it to sum and check if it has occurred before. 
  Reuses input from input file in a cycle.

  Returns the first sum that has occurred before.
  """
  def solution2(filepath) do
    [result] = read_input_file(filepath)
    |> Stream.cycle
    |> Stream.scan([0], 
        fn 
          value, [] -> [value]
          value, [head | _tail] = list -> [value + head] ++ list
        end
      )
    |> Stream.filter(
        fn
          [] -> false
          list -> length(Enum.uniq(list)) != length(list)
        end  
      )
    |> Stream.map(&List.first/1)
    |> Enum.take(1)

    result
  end

  defp read_input_file(filepath) do
    filepath
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_line/1)
  end

  defp parse_line("+" <> rest) do
    {result, ""} = Integer.parse(rest)
    result
  end
  defp parse_line("-" <> _rest = value) do
    {result, ""} = Integer.parse(value)
    result
  end

end
