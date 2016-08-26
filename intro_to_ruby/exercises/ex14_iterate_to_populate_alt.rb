contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

field_array = [:email, :address, :phone]

contacts.each do |name, hash|
  field_array.each do |field|
    hash[field] = contact_data.shift
  end
end

puts contacts