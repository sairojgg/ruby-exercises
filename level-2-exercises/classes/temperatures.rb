class Converter
	def celsius_to_fahrenheit(temperature)
		(temperature * 9/5) + 32
	end

	def fahrenheit_to_celsius(temperature)
		(temperature - 32) * 5/9
	end

	def show_menu()
		loop do
			puts [
				'Converter',
				'1 - celsius to fahrenheit',
				'2 - fahrenheit to celsius'
			]
			@option = gets.to_i
			break if @option == 1 || @option == 2
		end
	end

	def ask_temperature()
		if(@option == 1)
			puts 'Celsius?'
			puts celsius_to_fahrenheit(gets.to_f)
		elsif (@option == 2)
			puts 'Fahrenheits?'
			puts fahrenheit_to_celsius(gets.to_f)
		end
	end
end