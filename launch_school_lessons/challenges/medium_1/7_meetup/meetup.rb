require 'date'
require 'pry'

class Meetup
  DAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  NUMBER = { first: 1, second: 2, third: 3, fourth: 4 }
  TEENS = (13..19)

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    if schedule == :teenth
      find_teenth_day(weekday)

    elsif NUMBER.has_key?(schedule)
      find_nth_day(weekday, schedule)

    else
      find_last_day(weekday)
    end
  end

  private

  def same_weekday?(date, weekday)
    date.wday == DAYS.index(weekday)
  end

  def new_date(day)
    Date.new(@year, @month, day)
  end

  def find_teenth_day(weekday)
      day = 1

      loop do
        date = new_date(day)
        return date if TEENS.include?(day) &&
                       same_weekday?(date, weekday)
        day += 1
      end
  end

  def find_nth_day(weekday, schedule)
    counter = 0
    day = 1

    loop do
      date = new_date(day)
      if same_weekday?(date, weekday)
        counter += 1
      end
      return date if counter == NUMBER[schedule]
      day += 1
    end
  end

  def find_last_day(weekday)
    match_date = nil
    day = 1

    loop do
      begin
        date = new_date(day)
      rescue ArgumentError
        return match_date
      end
      match_date = date if same_weekday?(date, weekday)
      day += 1
    end
  end
end



