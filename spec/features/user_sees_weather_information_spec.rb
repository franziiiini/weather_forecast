require "rails_helper"

RSpec.describe "user sees weather information", type: :feature do
  context "with city name as an input" do
    it "show the current location" do
      visit "/"

      fill_in("location", with: "Eastchester")
      click_button("Submit")

      expect(page).to have_content("The current temperature in Eastchester, NY, USA, is")
    end
  end
end
