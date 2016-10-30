require 'date'

# def friday_13th?(year)
#   days = 0
#   1.upto(12) do |month|
#     days += 1 if Date.new(year, month, 13).friday?
#   end
#   days
# end

# def friday_13th?(year)
#   unlucky_days = 0
#   thirteenth = Date.new(year, 1, 13)
#   11.times do
#     unlucky_days +=1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_days +=1 if thirteenth.friday?
#   unlucky_days
# end

# p friday_13th?(2015) == 3
# p friday_13th?(1986) == 1

# further exploration

# def lucky_day(year)
#   seventh = Date.new(year, 1, 7)
#   11.times do
#     p seventh.strftime("%A")
#     seventh = seventh.next_month
#   end
#   p seventh.strftime("%A")
# end

# lucky_day(2015)
# lucky_day(1986)

THIRTY_ONE_DAY_MONTHS = [1, 3, 5, 7, 8, 10, 12]
THIRTY_DAY_MONTHS = [4, 6, 9, 11]

def penultimate(year)
  (1..12).each do |month|
    case
    when THIRTY_ONE_DAY_MONTHS.include?(month)
      p Date.new(year, month, 30).strftime("%B: %A")
    when THIRTY_DAY_MONTHS.include?(month)
      p Date.new(year, month, 29).strftime("%B: %A")
    else
      if Date.new(year).leap?
        p Date.new(year, month, 28).strftime("%B: %A")
      else
        p Date.new(year, month, 27).strftime("%B: %A")
      end
    end
  end
end

penultimate(2015)
penultimate(2000)