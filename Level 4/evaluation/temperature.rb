class TemperatureConverter
  def self.convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5) / 9
  end

  def self.convert_to_fahrenheit(celsius)
    ((celsius * 9) / 5) + 32
  end
end
