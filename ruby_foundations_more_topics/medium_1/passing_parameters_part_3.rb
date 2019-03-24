items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# number 1
=begin
gather(items) do | *produce, wheat |
  puts produce.join(', ')
  puts wheat
end
=end

# number 2
=begin
gather(items) do | apples, *produce, wheat |
  puts apples
  puts produce.join(', ')
  puts wheat
end
=end

# number 3
=begin
gather(items) do | apples, *produce |
  puts apples
  puts produce.join(', ')
end
=end

# number 4
=begin
gather(items) do | apples, corn, cabbage, wheat |
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
=end
