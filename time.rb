require 'date'

today = DateTime.now
#<DateTime: 441799066630193/180000000,-301/1440,2299161>

birthday = Date.new(2021, 10, 11)
#<Date: 4909133/2,0,2299161>

days_to_go = birthday - today

time_until = birthday - today
# Rational(22903369807, 180000000)

time_until.to_i             # get the number of days until my birthday
# 127

hours,minutes,seconds,frac = Date.day_fraction_to_time(time_until)
# [3053, 46, 57, Rational(1057, 180000000)]



puts "It is my birthday in #{hours} hours, #{minutes} minutes and #{seconds} seconds (not that I am counting)"
# It is my birthday in 3053 hours, 46 minutes and 57 seconds (not that I am counting)