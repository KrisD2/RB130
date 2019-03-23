require 'minitest'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_list
    list = ['abc', 'xyz', 'lnm']
    refute_includes(list, 'xyz')
  end

end
