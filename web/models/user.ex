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
  @required_fields ~w(email password)
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> unique_constraint(:email) # validates uniqueness of email
    |> validate_format(:email, ~r/@/) #check that it has an @
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 5)
  end
end
