class Diamond
  LETTERS = ('A'..'Z').to_a
  SPACING = [0] + (1..50).to_a.select(&:odd?)

  LETTERS_SPACING = LETTERS.each_with_object({}).with_index do |(l, hsh), idx|
                      hsh[l] = SPACING[idx]
                    end

  def self.make_diamond(letter)
    @@result = ''

    @@total_width = letter == 'A' ? 1 : LETTERS_SPACING[letter] + 2

    self.increase_width(letter)

    self.decrease_width(letter)

    @@result
  end

  def self.increase_width(letter)
    ('A'..letter).each do |el|
      inner_spacing = LETTERS_SPACING[el]
      letter_group = el == 'A' ? 'A' : el + ' '*inner_spacing + el    
      @@result << letter_group.center(@@total_width) << "\n"
    end
  end

  def self.decrease_width(letter)
    ('A'..letter).to_a.reverse.each do |el|
      next if letter == el
      inner_spacing = LETTERS_SPACING[el]
      letter_group = el == 'A' ? 'A' : el + ' '*inner_spacing + el    
      @@result << letter_group.center(@@total_width) << "\n"
    end
  end
end
