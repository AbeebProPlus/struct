defmodule Tutorials.Recursion.SumDigits do
  def upto(0) do
    0
  end

  def upto(num) do
    num + upto(num - 1)
  end
end
