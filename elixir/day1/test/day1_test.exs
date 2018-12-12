defmodule Day1Test do
  use ExUnit.Case
  doctest Day1


  test "+1, +1, +1 results in  3" do
    assert Day1.solution1("input/test1") == 3
  end

  test "+1, +1, -2 results in  0" do
    assert Day1.solution1("input/test2") == 0
  end

  test "-1, -2, -3 results in -6" do
    assert Day1.solution1("input/test3") == -6
  end

  test "+1, -1 first reaches 0 twice" do
    assert Day1.solution2("input/test4") == 0
  end

  test "+3, +3, +4, -2, -4 first reaches 10 twice" do
    assert Day1.solution2("input/test5") == 10
  end

  test "-6, +3, +8, +5, -6 first reaches 5 twice" do
    assert Day1.solution2("input/test6") == 5
  end

  test "+7, +7, -2, -7, -4 first reaches 14 twice" do
    assert Day1.solution2("input/test7") == 14
  end

end
