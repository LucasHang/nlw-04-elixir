defmodule NlwElixirPayday do
  alias NlwElixirPayday.Users.Create, as: UserCreate
  alias NlwElixirPayday.Users.Index, as: UserIndex

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate index_user(), to: UserIndex, as: :call
end
