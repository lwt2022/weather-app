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
