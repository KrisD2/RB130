require 'minitest'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_empty?
    assert_empty([]])
    assert_empty([1, 2, 3]])
  end

end
