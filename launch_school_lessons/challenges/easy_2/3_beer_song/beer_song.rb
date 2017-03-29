# class BeerSong
#   def verse(number)
#     result = ''

#     first_number = number
#     second_number = (number - 1 >= 0) ? (number - 1) : 99

#     first_string = number_to_string(first_number)
#     second_string = number_to_string(second_number)
#     take_down_string = take_down_string(first_number)

#     first_line = "#{first_string} of beer on the wall, #{first_string} of beer.\n".capitalize
#     second_line = "#{take_down_string}, #{second_string} of beer on the wall.\n".capitalize

#     result << "#{first_line}" + "#{second_line}"

#     result
#   end

#   def verses(start_verse, last_verse)
#     verses = []
#     start_verse.downto(last_verse) { |number| verses << verse(number) }
#     verses.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   private

#   def number_to_string(number)
#     case number
#     when 2..99 then "#{number} bottles"
#     when 1     then "#{number} bottle"
#     when 0     then "no more bottles"
#     end
#   end

#   def take_down_string(number)
#     case number
#     when 2..99 then "Take one down and pass it around"
#     when 1     then "Take it down and pass it around"
#     when 0     then "Go to the store and buy some more"
#     end
#   end
# end

# alt w/o conditionals

# class BeerSong
#   TWO_TO_NINETY_NINE_BOTTLES = (2..99).each_with_object({}) do |num, hsh|
#     hsh[num] = "#{num} bottles"
#   end
#   ZERO_TO_ONE_BOTTLES = { 0 => "no more bottles", 1 => "1 bottle"}
#   ALL_BOTTLES = ZERO_TO_ONE_BOTTLES.merge(TWO_TO_NINETY_NINE_BOTTLES)

#   TWO_TO_NINETY_NINE_TAKE_DOWN = (2..99).each_with_object({}) do |num, hsh|
#     hsh[num] = "Take one down and pass it around"
#   end
#   ZERO_TO_ONE_TAKE_DOWN = { 1 => "Take it down and pass it around", 
#                             0 => "Go to the store and buy some more" }
#   ALL_TAKE_DOWN = ZERO_TO_ONE_TAKE_DOWN.merge(TWO_TO_NINETY_NINE_TAKE_DOWN)

#   VERSE_ORDER = 99.downto(0).to_a + [99]

#   def verse(number)
#     result = ''

#     first_number = number
#     second_number = VERSE_ORDER[VERSE_ORDER.index(first_number) + 1]

#     first_string = ALL_BOTTLES[first_number]
#     second_string = ALL_BOTTLES[second_number]
#     take_down_string = ALL_TAKE_DOWN[first_number]

#     first_line = "#{first_string} of beer on the wall, #{first_string} of beer.\n".capitalize
#     second_line = "#{take_down_string}, #{second_string} of beer on the wall.\n".capitalize

#     result << "#{first_line}" + "#{second_line}"

#     result
#   end

#   def verses(start_verse, last_verse)
#     verses = []
#     start_verse.downto(last_verse) { |number| verses << verse(number) }
#     verses.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

# alt polymorphic

class Verse0
  def self.lyric(_)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class Verse1
  def self.lyric(_)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n" \
  end
end

class Verse2
  def self.lyric(_)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class VerseN
  def self.lyric(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  VERSE_TYPE = { 0 => Verse0, 1 => Verse1, 2 => Verse2, (3..99) => VerseN }

  def verse(num)
    # binding.pry
    VERSE_TYPE.find { |key, _| key === num }.last.lyric(num)
  end

  def verses(first, last)
    first.downto(last).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end