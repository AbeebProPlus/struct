defmodule Tutorials.Struct.Expense do
  alias Tutorials.Struct.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
          title: String.t(),
          date: Date.t() | nil,
          amount: number(),
          store: String.t()
        }
  @spec sample :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2022-08-12], amount: 500.25, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-08-11], amount: 144.25, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-05-10], amount: 50.25, store: "Marks"}
    ]
  end

  @spec total_expense([t()]) :: number()
  def total_expense(expenses) do
    Enum.reduce(expenses, 0, fn expense, acc -> acc + expense.amount end)
  end

  def sort_expense(expenses) do
    Enum.sort_by(expenses, & &1.date, Date)
  end

  def add_new(%Expense{} = expense) do
    [expense | sample()]
  end

  def update_amount(title, amount) do
    [item] = Enum.filter(sample(), fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}
    [new_item | sample() |> List.delete(item)]
  end

end
