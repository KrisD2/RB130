require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_odd?
    assert_equal(true, 3.odd?)
    assert_equal(false, 2.odd?)
  end

end
