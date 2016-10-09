DEGREE_SYMB = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(total_degrees)
#   total_seconds = (total_degrees * SECONDS_PER_DEGREE).round
#   total_minutes, seconds = total_seconds.divmod(60)
#   degrees, minutes = total_minutes.divmod(60)
#   format(%(#{degrees}#{DEGREE_SYMB}%02d'%02d"), minutes, seconds)
# end

# further exploration - negative numbers

def dms(total_degrees)
  total_degrees = 360 + total_degrees if total_degrees < 0
  total_seconds = (total_degrees * SECONDS_PER_DEGREE).round
  total_minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = total_minutes.divmod(60)
  format(%(#{degrees}#{DEGREE_SYMB}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(-76.73)