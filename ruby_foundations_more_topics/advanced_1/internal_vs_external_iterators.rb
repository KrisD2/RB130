factorial = Enumerator.new do |y|
  n = 1
  sum = 1
  loop do
    y << sum
    sum *= n
    n += 1
  end
end

7.times { puts factorial.next }

p factorial.take(7)
