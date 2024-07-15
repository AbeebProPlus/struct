defmodule Tutorials.Authenticate do
  @users [
    "John",
    "Doe"
  ]

  @passwords [
    "1234",
    "1234"
  ]

  def authenticate(user) when user in @users do
    {:ok, "user authenticated"}
  end

  def authenticate(_) do
    {:error, "unauthorized"}
  end

  def verify_password(password) when password in @passwords do
    {:ok, "password verified"}
  end

  def verify_password(user) do
    {:error, "incorrect password"}
  end

  def login(user, password) do
    with {:ok, _msg} <- authenticate(user),
         {:ok, _msg} <- verify_password(password) do
      {:ok, "#{user} logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
