def missing(arr)
  return [] if arr.size < 2
  all_nums = (arr.min..arr.max).to_a
  all_nums - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
