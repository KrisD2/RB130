require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_nil?
    assert_nil(nil)
    assert_nil(1)
  end

end
