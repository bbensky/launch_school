def create_uuid
  character_list = ("a".."f").to_a + (0..9).to_a
  uuid = ""
  8.times do
    uuid << character_list.sample.to_s
  end
  uuid << '-'
  3.times do
    4.times do
      uuid << character_list.sample.to_s
    end
    uuid << '-'
  end
  12.times do
    uuid << character_list.sample.to_s
  end
  uuid
end

puts create_uuid

def generate_UUID
  characters = [] 
  ('a'..'z').each { |digit| characters << digit }
  (1..9).each { |digit| characters << digit.to_s }
  
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid << characters.sample }
    uuid << '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID