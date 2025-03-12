# frozen_string_literal: true

class WeatherApiClient
  include HTTParty
  base_uri "https://api.weatherapi.com/v1/forecast.json"

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def current_temperature
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


  private

  def parsed_response
    response = HTTParty.get("https://api.weatherapi.com/v1/forecast.json?q=#{@zip_code}&days=1&key=#{ENV["WEATHER_API"]}")

    JSON.parse(response.body)
  end
end
