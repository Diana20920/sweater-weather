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
  - [Unsplash](https://unsplash.com/documentation)

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

 See the [open issues](https://github.com/Diana20920/sweater-weather/projects/2?add_cards_query=is%3Aopen) for a list of proposed features (and known issues).

## DB Schema
```ruby
create_table "users", force: :cascade do |t|
  t.string "email"
  t.string "password_digest"
  t.string "api_key"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

## Endpoints
1. Landing Page

  1a. `GET /api/v1/forecast?location=denver,co`

  <details>
  <summary>Example response </summary>

  ```json
  {
      "data": {
          "id": null,
          "type": "forecast",
          "attributes": {
              "current_weather": {
                  "date_time": "2021-06-15 21:52:59 -0400",
                  "sunrise": "2021-06-15 05:44:18 -0400",
                  "sunset": "2021-06-15 20:24:42 -0400",
                  "temperature": 72.63,
                  "feels_like": 72,
                  "humidity": 72,
                  "uvi": 0,
                  "visibility": 10000,
                  "conditions": "few clouds",
                  "icon": "02n"
              },
              "daily_weather": [
                  {
                      "date": "2021-06-15 13:00:00 -0400",
                      "sunrise": "2021-06-15 05:44:18 -0400",
                      "sunset": "2021-06-15 20:24:42 -0400",
                      "max_temp": 77,
                      "min_temp": 70,
                      "conditions": "light rain",
                      "icon": "10d"
                  },
                  {
                      "date": "2021-06-16 13:00:00 -0400",
                      "sunrise": "2021-06-16 05:44:22 -0400",
                      "sunset": "2021-06-16 20:25:02 -0400",
                      "max_temp": 76,
                      "min_temp": 67,
                      "conditions": "light rain",
                      "icon": "10d"
                  },
                  {
                      "date": "2021-06-17 13:00:00 -0400",
                      "sunrise": "2021-06-17 05:44:27 -0400",
                      "sunset": "2021-06-17 20:25:21 -0400",
                      "max_temp": 73,
                      "min_temp": 66,
                      "conditions": "clear sky",
                      "icon": "01d"
                  },
                  {
                      "date": "2021-06-18 13:00:00 -0400",
                      "sunrise": "2021-06-18 05:44:34 -0400",
                      "sunset": "2021-06-18 20:25:39 -0400",
                      "max_temp": 77,
                      "min_temp": 63,
                      "conditions": "few clouds",
                      "icon": "02d"
                  },
                  {
                      "date": "2021-06-19 13:00:00 -0400",
                      "sunrise": "2021-06-19 05:44:43 -0400",
                      "sunset": "2021-06-19 20:25:54 -0400",
                      "max_temp": 87,
                      "min_temp": 71,
                      "conditions": "light rain",
                      "icon": "10d"
                  }
              ],
              "hourly_weather": [
                  {
                      "time": "2021-06-15 21:00:00 -0400",
                      "temperature": 72,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-15 22:00:00 -0400",
                      "temperature": 72,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-15 23:00:00 -0400",
                      "temperature": 72,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-16 00:00:00 -0400",
                      "temperature": 71,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-16 01:00:00 -0400",
                      "temperature": 71,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-16 02:00:00 -0400",
                      "temperature": 70,
                      "conditions": "few clouds",
                      "icon": "02n"
                  },
                  {
                      "time": "2021-06-16 03:00:00 -0400",
                      "temperature": 69,
                      "conditions": "broken clouds",
                      "icon": "04n"
                  },
                  {
                      "time": "2021-06-16 04:00:00 -0400",
                      "temperature": 68,
                      "conditions": "light rain",
                      "icon": "10n"
                  }
              ]
          }
      }
  }
  ```
  </details>

  1b. `GET /api/v1/backgrounds?location=denver,co`

  <details>
  <summary>Example response </summary>

  ```json
  {
      "data": [
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1545270340-0168a34a7878?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHwxfHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/isG-Wz57Ttc",
                      "photographer": "David Barajas"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1597093879307-6dd923665c2c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHwyfHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/KPJ4xbBL72E",
                      "photographer": "The Silverdalex"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1591030249422-c8da23c0c252?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHwzfHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/bYNpoe6Flo8",
                      "photographer": "Sara Cottle"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1588082123191-800412ad7eba?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw0fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/lpmJZBEsUWE",
                      "photographer": "Doug Keeling"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1613333524865-59f732eb5b06?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw1fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/CMurH4MYADw",
                      "photographer": "Philippa Rose-Tite"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1617041742649-417acaf072a5?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw2fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/cGwzeH6i44A",
                      "photographer": "Edward Leon"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1621533651442-7e25daca8aa0?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw3fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/9M1zQF398NA",
                      "photographer": "Ian Hutchinson"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1621533650149-50f5c72d2bb1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw4fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/JFv4CdzLchg",
                      "photographer": "Ian Hutchinson"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1596137961170-d9583ef051af?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHw5fHxhcmxpbmd0b24lMkN2YXxlbnwwfHx8fDE2MjM4MDg1MjA&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/Pa4FF080OTA",
                      "photographer": "Cam Ferland"
                  }
              }
          },
          {
              "id": null,
              "type": "background_pic",
              "attributes": {
                  "location": "arlington,va",
                  "image_url": "https://images.unsplash.com/photo-1560776004-c2b0798a372a?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzg2NTd8MHwxfHNlYXJjaHwxMHx8YXJsaW5ndG9uJTJDdmF8ZW58MHx8fHwxNjIzODA4NTIw&ixlib=rb-1.2.1&q=85",
                  "credit": {
                      "source": "https://unsplash.com/photos/Rl3vv2dKvXM",
                      "photographer": "Sophie Smith"
                  }
              }
          }
      ]
  }
  ```
  </details>

2. User Registration:
    ```
    POST /api/v1/users
    Content-Type: application/json
    Accept: application/json

    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    ```
    <details>
    <summary>Example response </summary>

  ```json
  {
      "data": {
          "id": "2",
          "type": "users",
          "attributes": {
              "email": "another@email.com",
              "api_key": "c0050cf0ec1b934bcb8e2bb918e97db3"
          }
      }
  }
  ```
  </details>

3. User Login
    ```
    POST /api/v1/sessions
    Content-Type: application/json
    Accept: application/json

    {
      "email": "whatever@example.com",
      "password": "password"
    }
    ```
    <details>
      <summary>Example response </summary>

      ```json
      {
          "data": {
              "id": "1",
              "type": "users",
              "attributes": {
                  "email": "example@email.com",
                  "api_key": "1ddccb0b46a08b6475cea6f98f3301d6"
              }
          }
      }
      ```
      </details>


## Contributing

   Contributions are welcome! And they are **sincerely appreciated**.

   1. Fork the Project
   2. Create your Feature Branch (`git checkout -b feature/SweetFeature`)
   3. Commit your Changes (`git commit -m 'Add some SweetFeature'`)
   4. Push to the Branch (`git push origin feature/SweetFeature`)
   5. Open a Pull Request

## Acknowledgements
A big thank you to my fellow Software Engineers that contributed to my continued learning while working on this project.
- Khoa | [GitHub](https://github.com/Omegaeye)
- Brisa | [GitHub](https://github.com/brisag)
- Alexander | [GitHub](https://github.com/brueck1988)
