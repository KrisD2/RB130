def ignoring_first_two(array)
  yield(array)
end

ignoring_first_two([1, 2, 3, 4]) { |_, _, *arr| puts arr }
