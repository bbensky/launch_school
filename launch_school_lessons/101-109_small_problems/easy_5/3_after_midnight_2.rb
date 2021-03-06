require 'time'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

# def after_midnight(time)
#   hours, minutes = time.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# further exploration

def after_midnight(time_string)
  time = Time.parse(time_string)
  p (time.hour * MINUTES_PER_HOUR + time.min)
end

def before_midnight(time_string)
  (MINUTES_PER_DAY - after_midnight(time_string)) % MINUTES_PER_DAY
end

after_midnight('12:34')
