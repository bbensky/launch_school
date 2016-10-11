def letter_case_count(string)
  case_totals = { lowercase: 0, uppercase: 0, neither: 0}
  string.each_char do |char|
    case char
    when ('a'..'z') then case_totals[:lowercase] += 1
    when ('A'..'Z') then case_totals[:uppercase] += 1
    else                 case_totals[:neither] += 1
    end
  end
  case_totals
end

# alt w/ Array#count and regex

# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }
#   counts
# end

# alt simplified

# def letter_case_count(string)
#   counts = {}
#   counts[:lowercase] = string.count('a-z')
#   counts[:uppercase] = string.count('A-Z')
#   counts[:neither] = string.count('^a-zA-Z')
#   p counts
# end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }