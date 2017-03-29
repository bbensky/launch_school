# remove invalid characters
  # account for all characters that are not letters, numbers, apostrophes:
    # 1) convert new line characters to spaces
    # 2) convert apostrophes preceded or followed by a space to a space
    # 3) remove all characters that are not apostrophe, letter or number

# input: string
# output: hash

string = "car : carpet as java : javascript!!&@$%^&"

REMOVALS = ["\n", "' ", " '", /[^a-zA-Z0-9']/]

# string.gsub!("\n", ' ')

# string.gsub!("' ", ' ')

# string.gsub!(" '", ' ')

# string.gsub!(/[^a-zA-Z0-9']/, ' ')

REMOVALS.each { |removal| string.gsub!(removal, ' ')}

p string.split

class Phrase
  REMOVALS = ["\n", "' ", " '", /[^a-zA-Z0-9']/]

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = isolate_words

    words.each_with_object({}) do |word, result|
      result[word] = words.count(word)
    end
  end

  private

  def isolate_words
    REMOVALS.each { |removal| @phrase.gsub!(removal, ' ')}
    @phrase.split.map(&:downcase)
  end
end

phrase = Phrase.new('one of each')
p phrase.word_count