require 'httparty'

class Weather
  attr_reader :location, :temperature, :condition, :humidity, :wind_speed, :icon

  def initialize(location:, temperature:, condition:, humidity:, wind_speed:, icon:)
    @location = location
    @temperature = temperature
    @condition = condition
    @humidity = humidity
    @wind_speed = wind_speed
    @icon = icon
  end
end


class WeatherService
  API_KEY = 'c81613f997c84764b82124832230807'

  def self.current_weather(location)
    url = "http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{location}&aqi=no"
    response = HTTParty.get(url)
    weather_data = JSON.parse(response.body)

    condition_icon = map_condition_to_icon(weather_data['current']['condition']['code'])

    Weather.new(
      location: location,
      temperature: weather_data['current']['temp_c'],
      condition: weather_data['current']['condition']['text'],
      humidity: weather_data['current']['humidity'],
      wind_speed: weather_data['current']['wind_kph'],
      icon: condition_icon
    )
  end

  def self.map_condition_to_icon(condition_code)
    case condition_code
    when 1000
      'wi-day-sunny.svg'
    when 1003..1009
      'wi-cloud.svg'
    when 1063..1189
      'wi-rain.svg'
    when 1192..1195, 1240..1246
      'wi-showers.svg'
    when 1180..1183, 1186..1189, 1249..1255
      'wi-rain-mix.svg'
    when 1261..1273
      'wi-thunderstorm.svg'
    when 1276..1282
      'wi-snow.svg'
    when 1290..1292, 1300..1306
      'wi-sleet.svg'
    else
      'wi-na.svg'
    end
  end
end
