# Sweater Weather
An application that will help you plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination of their choice.

I am working in a service-oriented architecture and my focus is to expose an API that satisfies the front-end team’s requirements since the front-end will be communicating with this back-end application through the API.

*Note:* This is a final project for Module 3 of the Turing School of Software & Design Back-End Program (ACCET-accredited).

### Author
- Diana Buffone | [GitHub](https://github.com/Diana20920) |
  [LinkedIn](https://www.linkedin.com/in/dianabuffone/)

## Table of Contents
  - [Built With](#built-with)
  - [Getting Started](#getting-started)
  - [Usage](#usage)
  - [Running the tests](#running-the-tests)
  - [Roadmap](#roadmap)
  - [DB Schema](#db-schema)
  - [Endpoints](#endpoints)
  - [Contributing](#contributing)
  - [Acknowledgements](#acknowledgements)

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Built With

* [Ruby on Rails](https://rubyonrails.org)

### Gems Used
- [Faraday](https://github.com/lostisland/faraday)
- [Bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
- [Figaro](https://github.com/laserlemon/figaro)
- [Travis](https://github.com/travis-ci/travis.rb)
- [Rubocop](https://github.com/rubocop/rubocop)
- [Webmock](https://github.com/bblimke/webmock)
- [VCR](https://github.com/vcr/vcr)


<!-- ## Service Oriented Architecture Diagram -->
### Prerequisites

To run this application you will need 
* Ruby 2.5.3 and Rails 5.2.6
* Sign up for an API key at:
  - [OpenWeather](https://home.openweathermap.org/users/sign_up)
  - [MapQuest](https://developer.mapquest.com/user/register)

## Getting Started

To get a local copy up and running follow these simple steps:
1. Fork this repo
2. Clone your forked repo to your local machine
   ```sh
   git clone <git@github.com:your_github_username/sweater-weather.git>
   ```
3. Install gem packages
   ```sh
   bundle install
   ```
4. Install Figaro
   ```sh
   bundle exec figaro install
   ```
6. Setup your API keys in your `config/application.yml` file
   ```ruby
   WEATHER_KEY: <your_api_key>
   MAPS_KEY: <your_api_key>
   PICS_KEY: <your_api_key>
   ```

## Usage
   1. Create rails database and migrate
       ```sh
        rails db:{create,migrate}
       ```
   2. Start rails server
       ```sh
       rails s
       ```
   3. Nagivate to `http://localhost:3000/`

## Running the tests
RSpec testing suite is utilized for testing this application.
- Run the RSpec suite to ensure everything is passing as expected
  ```sh
  bundle exec rspec
  ```

## Roadmap

 See the [open issues]() for a list of proposed features (and known issues).


## Contributing

   Contributions are welcome! And they are **sincerely appreciated**.

   1. Fork the Project
   2. Create your Feature Branch (`git checkout -b feature/SweetFeature`)
   3. Commit your Changes (`git commit -m 'Add some SweetFeature'`)
   4. Push to the Branch (`git push origin feature/SweetFeature`)
   5. Open a Pull Request

## Acknowledgements
