# frozen_string_literal: true

class ForecastsController < ApplicationController
  def index
    return if params[:location].nil?

    @weather_api_client = weather_api_client(params[:location])
    @weather_attributes = @weather_api_client.mapped_weather_attributes
  end


  private

  def weather_api_client(location)
    WeatherApiClient.new(location)
  end
end
