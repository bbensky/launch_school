contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

field_array = [:email, :address, :phone]

contacts.each do |key, value|
  until field_array == [] 
    contacts[key][field_array.first] = (contact_data.first)
    field_array.shift
    contact_data.shift
  end
end

puts contacts