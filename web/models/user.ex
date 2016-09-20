defmodule Blog.User do
  use Blog.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :crypted_password])
    |> unique_constraint(:email) # validates uniqueness of email
    |> validate_format(:email, ~r/@/) #check that it has an @
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
  end
end
