def compute
  block_given? ? yield : 'Does not compute.'
end
