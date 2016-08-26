contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

field_array = [:email, :address, :phone]

contacts.each do |key, value|
  for i in 0..field_array.length-1 do
    contacts[key][field_array[i]] = (contact_data[0][i])
  end
  contact_data.shift
end

puts contacts