require "rails_helper"

RSpec.describe ForecastsController, type: :controller do
  describe "GET #index" do
    it "renders the index template & returns 200" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it 'accepts input params and returns the weather api response' do
      weather_api_client = double(WeatherApiClient)
      allow(weather_api_client).to receive(:parsed_response).and_return(parsed_forecast_json)

      get :index, params: { location: "10709" }
    end

    private

    def parsed_forecast_json
      JSON.parse(
        File.read("spec/fixtures/forecast.json")
      )
    end
  end
end
