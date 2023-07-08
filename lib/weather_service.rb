require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'http://api.weatherapi.com/v1'

  def self.current_weather(city)
    response = get('/current.json', query: { key: 'c81613f997c84764b82124832230807', q: city, aqi: 'no' })
    response.parsed_response
  end
end
