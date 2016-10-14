# def swap_name(name)
#   name.split.reverse.join(', ')
# end

# alt longer

# def swap_name(name)
#   names = name.split
#   "#{names[1]}, #{names[0]}"
# end

# alt w/ assigning array elements

# def swap_name(name)
#   first, last = name.split
#   "#{last}, #{first}"
# end

# alt w/o interpolation

def swap_name(full_name)
  first, last = full_name.split
  [last, first].join(', ')
end


p swap_name('Joe Roberts') == 'Roberts, Joe'