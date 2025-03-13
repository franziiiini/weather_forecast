# frozen_string_literal: true

class WeatherApiClient
  include HTTParty

  def initialize(location)
    @location = location
  end

  def mapped_weather_attributes
    {
      location_name: location_name,
      current_temp: current_temp,
      condition: condition,
      min_temp: min_temp,
      max_temp: max_temp
    }
  end

  def parsed_response
    response = HTTParty.get(
      "https://api.weatherapi.com/v1/forecast.json?q=#{@location}&days=1&key=#{ENV["WEATHER_API"]}"
      )
      # Error handling
      # {"error" => {"code" => 1006, "message" => "No matching location found."}}

      JSON.parse(response.body)
  end

  private

  def location_name
    "#{city}, #{region}, #{country},"
  end

  def city
    parsed_response["location"]["name"]
  end

  def region
    parsed_response["location"]["region"]
  end

  def country
    parsed_response["location"]["country"]
  end

  def current_temp
    parsed_response["current"]["temp_f"]
  end

  def condition
    parsed_response["current"]["condition"]["text"]
  end

  def min_temp
    parsed_response["forecast"]["forecastday"][0]["day"]["mintemp_f"]
  end

  def max_temp
    parsed_response["forecast"]["forecastday"][0]["day"]["maxtemp_f"]
  end
end
