require "rails_helper"

RSpec.describe ForecastsController, type: :controller do
  describe "GET #index" do
    context "when no params are present" do
      it "returns 200" do
        get :index

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with location params' do
      it 'accepts params calls the weather api client' do
        weather_api_client = double
        allow(WeatherApiClient).to receive(:new).with("10709").and_return(weather_api_client)
        allow(weather_api_client).to receive(:mapped_weather_attributes)

        get :index, params: { location: "10709" }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
