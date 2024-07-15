defmodule Tutorials.Recursion.Factorial do
  def upto(1), do: 1
  def upto(num) do
    num * upto(num - 1)
  end
end
