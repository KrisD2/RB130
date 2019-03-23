def step(starting, ending, increment_by)
  current_value = starting
  while current_value <= ending
    yield(current_value)
    current_value += increment_by
  end
  current_value
end

step(1, 10, 3) { |value| puts "value = #{value}" }
