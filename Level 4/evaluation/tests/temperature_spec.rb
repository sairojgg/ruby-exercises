require_relative '../temperature'

describe 'TemperatureConverter' do
  context 'correctly converts' do
    example '17 Celsius into 62 Fahrenheit' do
      expect(TemperatureConverter.convert_to_fahrenheit(17)).to eq 62
    end
    example '89 Fahrenheit into 31 Celsius' do
      expect(TemperatureConverter.convert_to_celsius(89)).to eq 31
    end
  end
end
