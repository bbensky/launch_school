flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.byteslice(0, 3) }

# alt

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3) }


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0,3]
end