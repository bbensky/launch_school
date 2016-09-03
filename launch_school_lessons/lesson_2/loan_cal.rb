def prompt(text)
  puts ">> #{text}"
end

# Methods to format numbers to pass validation

def remove_extra_characters(number)
  number.delete(", % $")
end

def fix_double_zeros_after_decimal(number)
  return number.chop if number.end_with?(".00")
  number
end

def fix_number_starting_with_decimal(number)
  number.insert(0, "0") if number.start_with?(".")
  number
end

def format_number(number)
  number = remove_extra_characters(number)
  number = fix_double_zeros_after_decimal(number)
  fix_number_starting_with_decimal(number)
end

# Methods to validate the number

def integer?(number)
  number == number.to_i.to_s
end

def float?(number)
  number == number.to_f.to_s
end

def valid_number?(number)
  (integer?(number) || float?(number)) && (number.to_f >= 0)
end

# Method to input and return a valid number

def get_input(instructions)
  loop do
    prompt(instructions)
    input = gets.chomp
    formatted_input = format_number(input)
    return formatted_input.to_f if valid_number?(formatted_input)
    prompt("Sorry, that is not a valid number.")
  end
end

# Method to calculate payment

def payment_calculation(loan_amount, rate_in_months, months_to_pay)
  monthly_payment = if months_to_pay.zero?
                      loan_amount
                    elsif rate_in_months.zero?
                      loan_amount / months_to_pay
                    else
                      loan_amount * (rate_in_months /
                        (1 - (1 + rate_in_months)**-months_to_pay))
                    end
  format("%.2f", monthly_payment)
end

prompt("Welcome to the Loan Calculator.")

loop do
  loan_amount = get_input("Please enter the loan amount in dollars.")

  apr = get_input("Please enter the APR as a percent.")
  rate_in_months = apr / 100 / 12

  duration_in_years = get_input("Please enter the loan duration in years.")
  duration_in_months = duration_in_years * 12

  monthly_payment = payment_calculation(loan_amount, rate_in_months,
                                        duration_in_months)

  prompt("Your monthly payment will be $#{monthly_payment}")

  prompt("'Y' if you would like to try another calculation.")
  prompt("Use any other key to exit.")
  again = gets.chomp.downcase
  break unless again.start_with?("y")
end

prompt("Thank you for using the loan calculator. Goodbye!")
