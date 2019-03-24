require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_downcase
    assert_equal('xyz', 'XYZ'.downcase)
    assert_equal('xyz', 'ABC'.downcase)
  end

end
