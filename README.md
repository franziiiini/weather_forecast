# README

Add your WeatherAPI-key to the `.env`. You can do this by creating a copy of `.env` as `.env.local`,
to not commit the key publicly upon contributing to this project.

## Current state of art

This app uses the WeatherAPI as a service to provide the requested weather data.
It accepts different kind of address inputs and is free to use.

This is a very basic setup that still needs further iterations, and more testing to improve the
quality of the app.

Such as:

### Next Steps

- Add Caching as requested instruction & indicate that result comes from the cache or is fresh
- Finalize request specs for forecast api call with mocked json respone
- Add more feature specs for user to see results
- Error handling for API errors (e.g. if location is not found), internal error handling
- Consider splitting the Client instantiation and the response mapping into two classes to keep
  single responsibilities
- Use haml for views
- Update styling to be more appealing
- Add localization (i18n)
- as always "naming things" consider better class and variables naming

### Nice to have

- Further information: Add Celsius temps to make it more international, show forecast temps for
  following day(s)
- UI improvements: show Icons/ or Image depending on weather condition
