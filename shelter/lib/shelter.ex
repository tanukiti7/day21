defmodule Shelter do
  defstruct [:keys, :vals]

  def load do
    "130001_evacuation_center.csv"
    |> File.stream!
    |> CSV.decode
    |> Enum.to_list
    |> Enum.map(fn x -> tuple_to_list(x) end)
  end


  def tuple_to_list(tuple_data) do
    case tuple_data do
    {:ok, result} -> result
    {:error, _result} -> []
    end
  end

  def csv_struct(head, tail) do
    %Shelter{keys: head, vals: tail }
  end

  def keys_vals(struct) do
    Enum.map(struct.vals, fn val -> to_map(struct.keys, val) end)
  end

  def to_map(key, val) do
    List.zip([ key, val ])
    |> Enum.into(%{})
  end



  def insert(list) do
    struct = %Shelter.Shelter{}
    shelters = Enum.map(list, &Map.merge(struct, &1))
   #Shelter.Repo.start_link()
  Enum.each(shelters, fn(shelter) -> Shelter.Repo.insert(shelter) end)
  end

  def main do
    data_list = load()
    head = hd(data_list)
    |> List.replace_at(0, :name)
    |> List.replace_at(1, :code)
    |> List.replace_at(2, :prefectures)
    |> List.replace_at(3, :locationname)
    |> List.replace_at(4, :address)
    |> List.replace_at(5, :lat)
    |> List.replace_at(6, :lng)
    keys_vals(csv_struct(head, tl(data_list)))
    |> insert()
    #チェック
    Shelter.Shelter |> Shelter.Repo.all
   end
end







end
