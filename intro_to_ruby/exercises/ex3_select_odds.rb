arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odds_arr = arr.select { |num| num.odd? }

p odds_arr

# alt

odds_arr = arr.select do |num| 
  num % 2 != 0 }
end

p odds_arr
