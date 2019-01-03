defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  test "dabAcCaCBAcCcaDA returns 10 after reaction" do
    assert Day5.solution1("input/test1") == 10
  end
end
