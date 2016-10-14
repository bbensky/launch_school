def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3.to_f

  case average
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  when (0...60) then 'F'
  else              'A+++'  
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(101, 103, 105) == "A+++"
p get_grade(89.9, 89.99, 89.999) == "B"