# frozen_string_literal: true

class ForecastsController < ApplicationController
  def index
    return if location_params.nil?

    @weather_api_client = WeatherApiClient.new(location_params)
    @weather_attributes = @weather_api_client.mapped_weather_attributes
  end


  private

  def location_params
    params[:location]
  end
end
