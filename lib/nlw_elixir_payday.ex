defmodule NlwElixirPayday do
  alias NlwElixirPayday.Users.Create, as: UserCreate
  alias NlwElixirPayday.Users.Index, as: UserIndex

  alias NlwElixirPayday.Accounts.{Deposit, Withdraw, Transaction}
  alias NlwElixirPayday.Accounts.Index, as: AccountIndex

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate index_user(), to: UserIndex, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
  defdelegate index_account(), to: AccountIndex, as: :call
end
