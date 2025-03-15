require "rails_helper"

RSpec.describe "user searches for weather information", type: :feature do
  context "when user submits a valid input" do
    it "shows the current location and weather information" do
      weather_api_client = double
      allow(WeatherApiClient).to receive(:new).with("Eastchester").and_return(weather_api_client)
      allow(weather_api_client).to receive(:mapped_weather_attributes).and_return(
        {
          location_name: "Eastchester, NY, USA",
          current_temp: "50",
          condition: "Cloudy",
          min_temp: "40",
          max_temp: "50"
        }
      )

      visit "/"

      fill_in("location", with: "Eastchester")
      click_button("Submit")

      expect(page).to have_content(
        "The current temperature in Eastchester, NY, USA is 50 F."
        )
      expect(page).to have_content(
        "Expect cloudy conditions, with a low of 40 F and a high of 50 F."
        )
    end
  end

  context 'when user submits an invalid input' do
    it 'shows an error that the location was not found' do
    end
  end
end
