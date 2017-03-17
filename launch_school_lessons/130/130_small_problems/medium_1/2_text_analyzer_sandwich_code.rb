# class TextAnalyzer
#   def process
#     file = File.read('coyote_roadrunner.txt')
#     yield(file)
#   end
# end

# alt LS solution w/ File#open and #close

class TextAnalyzer
  def process
    file = File.open('coyote_roadrunner.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").size} lines" }
analyzer.process { |file| puts "#{file.split.size} words" }