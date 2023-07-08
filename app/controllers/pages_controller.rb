require 'weather_service'

class PagesController < ApplicationController
  def welcome
    @weather = WeatherService.current_weather('Tokyo')
  end
end
