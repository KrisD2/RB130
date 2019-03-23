require 'minitest'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_kind
    value = 2.0
    assert_kind_of(Numeric, value)
  end

end
