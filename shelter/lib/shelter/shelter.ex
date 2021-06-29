defmodule Shelter.Shelter do
  use Ecto.Schema
  schema "shelters" do
    field :name, :string
    field :code, :string
    field :prefectures, :string
    field :locationname, :string
    field :address, :string
    field :lat, :string
    field :lng, :string

  end
 end
