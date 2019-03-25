require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text_content = File.read('/Users/kd/Documents/launch-school/rb130/ruby_foundations_more_topics/medium_2_testing/text.txt')
    @sample = Text.new(@text_content)
  end

  def teardown
    @sample.text = @text_content
  end

  def test_swap
    a_count = @sample.text.count 'a'
    e_count = @sample.text.count 'e'
    swapped_text = @sample.swap('a', 'e')
    assert_equal(a_count + e_count, swapped_text.count('e'))
  end

  def test_word_count
    assert_equal(72, @sample.word_count)
  end
end
