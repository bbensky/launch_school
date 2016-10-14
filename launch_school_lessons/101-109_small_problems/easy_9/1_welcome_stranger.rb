# def greetings(names, job_title)
#   full_name = names.join(' ')
#   full_title = job_title.values.join(' ')
#   p "Hello, #{full_name}! Nice to have a #{full_title} around."
# end

# one line

def greetings(name, status)
  p "Hello, #{name.join(' ')}! Nice to have a " \
    "#{status[:title]} #{status[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) ==
"Hello, John Q Doe! Nice to have a Master Plumber around."