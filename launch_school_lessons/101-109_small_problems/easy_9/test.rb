def swap_name(full_name)
  first, last = full_name.split
  [last, first].join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'