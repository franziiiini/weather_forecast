# frozen_string_literal: true

class ForecastController < ApplicationController
  def index
    if params[:zip_code].present?
      @weather_api_client = weather_api_client(params[:zip_code])
      @current_temperature = @weather_api_client.current_temperature
      @condition = @weather_api_client.condition
      @min_temp = @weather_api_client.min_temp
      @max_temp = @weather_api_client.max_temp
    else
      @current_temperature = nil
    end
  end


  private

  def weather_api_client(zip_code)
    WeatherApiClient.new(zip_code)
  end
end
