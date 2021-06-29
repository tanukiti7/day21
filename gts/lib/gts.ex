defmodule Gts do

  def to_list do
    {:ok, cube}= File.read("cube.gts")

    cube
    |> String.split(["\n","\n "])
    |> List.delete("")
    |> Enum.map(fn x -> String.split(x, " ") end)
    |> Enum.map(fn x -> List.delete(x, "") end)
    |> Enum.map(fn x -> List.delete(x, "") end)
   # |> Enum.map(fn x -> Enum.map(x, fn y -> String.to_integer(y) end) end)

  end

  def to_map do
    list = to_list()
    [head|_tail] = list
    a = fn [x, y, z] -> %{"頂点の数" => x, "線分の数" => y, "三角形の数" => z} end
    b = Enum.slice(list, 1..8)
        |> Enum.map(fn [x, y, z] -> %{"x成分値" => x, "y成分値" => y, "z成分値" => z} end)
    c = Enum.slice(list, 9..26)
        |> Enum.map(fn [x, y] -> %{"始点の頂点番号" => x, "終点の頂点番号" => y} end)
    d = Enum.slice(list, 27..38)
        |> Enum.map(fn [x, y, z] -> %{"1点目の線分番号" => x, "2点目の線分番号" => y, "3点目の線分番号" => z} end)
    List.flatten([a.(head), b, c, d])

  end

  def to_json do
    map_list = to_map()
    Poison.encode!(map_list)
  end
end
