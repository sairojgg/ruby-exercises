require 'date'

date_sent = Date.parse(‘2021-10-11’)
date_now = Date.today

how_many_days_have_passed = (date_now - date_sent).to_i



puts "It is my birthday in #{hours} hours, #{minutes} minutes and #{seconds} seconds (not that I am counting)"
# It is my birthday in 3053 hours, 46 minutes and 57 seconds (not that I am counting)