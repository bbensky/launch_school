def count_occurrences(items)
  unique_items = items.uniq
  unique_items.each do |item|
    puts "#{item} => #{items.count(item)}"
  end
end

def count_occurrences_hash(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

def count_occurences_one_iteration(array)
  occurrences = {}

  array.uniq.each do |element|
    element_count = 0
    index = 0
    until index >= array.size
      element_count += 1 if array.fetch(index) == element
      index += 1  
    end
    occurrences[element] = element_count
  end

  occurrences.each { |key, value| puts "#{key} => #{value}"}
end

def count_occurrences_one_iteration_shorter(array)
  occurrences = Hash.new(0)

  array.size.times do |index|
    occurrences[array[index]] += 1
  end

  occurrences.each { |key, value| puts "#{key} => #{value}"}
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

count_occurrences_hash(vehicles)

count_occurences_one_iteration(vehicles)

count_occurrences_one_iteration_shorter(vehicles)

