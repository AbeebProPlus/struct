defmodule Tutorials.Recursion.PrintDigits do
  #  def upto(0), do: :done

  def upto(0) do
    :done
  end

  def upto(nums) do
    upto(nums - 1)
    IO.puts(nums)
  end
end
