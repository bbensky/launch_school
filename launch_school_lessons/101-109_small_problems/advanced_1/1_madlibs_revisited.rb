# NOUNS = %w(cat dog tail goat)
# VERBS = %w(licks eats sleeps runs)
# ADJECTIVES = %w(brown slow sleepy green)
# ADVERBS = %w(quickly happily frightfully noisily)

# text = File.read('madlibs.txt')
# words = text.split
# words.each do |word|
#   case
#   when word.include?('#{noun}') then word.gsub!('#{noun}', NOUNS.sample)
#   when word.include?('#{verb}') then word.gsub!('#{verb}', VERBS.sample)
#   when word.include?('#{adjective}') then word.gsub!('#{adjective}', ADJECTIVES.sample)
#   when word.include?('#{adverb}') then word.gsub!('#{adverb}', ADVERBS.sample)
#   end
# end
# puts words.join(' ')

# alt w/ format

NOUNS = %w(cat dog tail goat).freeze
VERBS = %w(licks eats sleeps runs).freeze
ADJECTIVES = %w(brown slow sleepy green).freeze
ADVERBS = %w(quickly happily frightfully noisily).freeze

File.open('madlibs_with_format.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end