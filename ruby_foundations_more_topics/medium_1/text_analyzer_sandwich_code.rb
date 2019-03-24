class TextAnalyzer
  def process
    file_content = File.read("/Users/kd/Documents/launch-school/rb130/ruby_foundations_more_topics/medium_1/text.txt")
    yield(file_content)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.scan(/\s\s/).size + 1} paragraphs" }
analyzer.process { |text| puts "#{text.scan(/\n/).size} lines" }
analyzer.process { |text| puts "#{text.scan(/\w*.\s/).size} words" }
