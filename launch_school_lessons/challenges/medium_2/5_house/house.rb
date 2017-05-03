# first line 
  # first array element, prepend with "This is "
# other lines
  # first element prepend with second element from previous index

# number of verses
  # pieces array length

# data structure: 
  # string, separated by new line

require 'pry'

class House
  def self.recite
    result = ''
    pieces = self.new.get_pieces
    number_of_verses = pieces.length
    starting_index = number_of_verses - 1

    starting_index.downto(0) do |index|
      verse = ''
      verse << 'This is ' + pieces[index].first + "\n"
      
      if index != starting_index
        index.upto(starting_index - 1) do |idx|
          verse << pieces[idx].last << ' ' << pieces[idx+1].first + "\n"
        end

      end
      verse[-1] = ".\n\n"
      result << verse
    end
    
    result[-1] = ''
    result
  end

  def get_pieces
    pieces
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

puts House.recite
