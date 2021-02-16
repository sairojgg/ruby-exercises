class TemperatureConverter
    def convertToFahrenheit(temperature)
        ((temperature.to_f * 9/5) + 32).round(2)
    end

    def convertToCelsius(temperature)
        ((temperature.to_f - 32) * 5/9).round(2)
    end
end

converter = TemperatureConverter.new
puts "Celsius: #{converter.convertToCelsius(53.6)}"
puts "Fahrenheit: #{converter.convertToFahrenheit(12.22)}"