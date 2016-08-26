rufus = { animal: "dog",
          species: "mutt",
          name: "Rufus",
          nickname: "Bubba",
          age: 8,
          color: "brown"
        }

puts rufus.each_key { |k| puts k } 
puts rufus.each_value { |v| puts v }
puts rufus.each_pair { |k,v| puts "#{k} is #{v}" }
# alt for line 11 is puts rufus.each { |k,v| puts "#{k} is #{v}" }