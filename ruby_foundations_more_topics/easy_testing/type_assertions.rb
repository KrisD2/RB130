require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_class
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

end
