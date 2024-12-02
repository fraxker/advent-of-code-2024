data = File.stream!("input1.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.split/1)
|> Stream.flat_map(& &1)
|> Stream.map(&String.to_integer/1)
|> Stream.with_index
|> Enum.split_with(fn {_num, index} -> rem(index, 2) == 0 end)


right = Enum.map(elem(data, 1), fn {num, _index} -> num end)

Enum.map(elem(data, 0), fn {num, _index} -> num end)
|> Enum.flat_map(fn l -> Enum.map(right, fn r -> {l, r} end) end)
|> Enum.filter(fn {l, r} -> l == r end)
|> Enum.map(fn {l, _r} -> l end)
|> Enum.sum()
|> IO.inspect()
