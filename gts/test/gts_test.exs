defmodule GtsTest do
  use ExUnit.Case
  doctest Gts

  test "greets the world" do
    assert Gts.hello() == :world
  end
end
