(0..9).each { |x| puts 'The Flintstones Rock'.insert(0, ' ' * x) }

# alt

(0..9).step { |x| puts 'The Flintstones Rock'.insert(0, ' ' * x) }

# alt2

10.times { |number| puts (' ' * number) + 'The Flintstones Rock!' }