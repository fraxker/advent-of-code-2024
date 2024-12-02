data = File.stream!("input1.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.split/1)
|> Stream.flat_map(& &1)
|> Stream.map(&String.to_integer/1)
|> Stream.with_index
|> Enum.split_with(fn {_num, index} -> rem(index, 2) == 0 end)

left = Enum.map(elem(data, 0), fn {num, _index} -> num end)
|> Enum.sort()
right = Enum.map(elem(data, 1), fn {num, _index} -> num end)
|> Enum.sort()

Enum.zip(left, right)
|> Enum.map(fn {l, r} -> abs(l - r) end)
|> Enum.sum()
|> IO.inspect()
