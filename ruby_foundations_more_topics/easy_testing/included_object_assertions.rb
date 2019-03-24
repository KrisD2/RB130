require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_include?
    list = ['xyz', 'abc', 'qrs']
    assert_includes(list, 'xyz')
  end

end
