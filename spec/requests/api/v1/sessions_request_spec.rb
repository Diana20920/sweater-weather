require 'rails_helper'

RSpec.describe "Login Response" do
  describe 'happy path' do
    it 'logs in a registered user' do
      new_user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers1 = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/users', headers: headers1, params: JSON.generate(new_user_params)

      registered_user = User.last

      login_params = {
        "email": "whatever@example.com",
        "password": "password"
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      login_response = JSON.parse(response.body, symbolize_names: true)

      expect(login_response).to have_key(:data)
      expect(login_response[:data]).to be_a(Hash)
      expect(login_response[:data]).to have_key(:type)
      expect(login_response[:data]).to have_key(:id)
      expect(login_response[:data][:id]).to eq("#{registered_user.id}")
      expect(login_response[:data]).to have_key(:attributes)

      type = login_response[:data][:type]

      expect(type).to be_a(String)
      expect(type).to eq("users")

      attributes = login_response[:data][:attributes]

      expect(attributes).to have_key(:email)
      expect(attributes[:email]).to eq(registered_user.email)
      expect(attributes).to have_key(:api_key)
      expect(attributes[:api_key]).to be_a(String)
      expect(attributes[:api_key]).to eq("#{registered_user.api_key}")
      expect(attributes).to_not have_key(:password)
    end
  end

  describe 'sad path' do
    it 'user does not exist' do
      login_params = {
        "email": "another@example.com",
        "password": "password"
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to have_http_status(400)
      failed_login = JSON.parse(response.body, symbolize_names: true)

      expect(failed_login).to have_key(:error)
      expect(failed_login).to_not have_key(:data)
      expect(failed_login[:error]).to eq('Invalid credentials')
    end

    it 'user email is incorrect' do
      new_user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers1 = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/users', headers: headers1, params: JSON.generate(new_user_params)

      registered_user = User.last

      login_params = {
        "email": "wrong_Email@example.com",
        "password": "password"
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to have_http_status(400)

      failed_login = JSON.parse(response.body, symbolize_names: true)

      expect(failed_login).to have_key(:error)
      expect(failed_login).to_not have_key(:data)
      expect(failed_login[:error]).to eq('Invalid credentials')
    end

    it 'user password is incorrect' do
      new_user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers1 = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/users', headers: headers1, params: JSON.generate(new_user_params)

      registered_user = User.last

      login_params = {
        "email": "whatever@example.com",
        "password": "wrong1password1"
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to have_http_status(400)

      failed_login = JSON.parse(response.body, symbolize_names: true)

      expect(failed_login).to have_key(:error)
      expect(failed_login).to_not have_key(:data)
      expect(failed_login[:error]).to eq('Invalid credentials')
    end

    it 'user email is blank' do
      new_user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers1 = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/users', headers: headers1, params: JSON.generate(new_user_params)

      registered_user = User.last

      login_params = {
        "email": "",
        "password": "password"
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to have_http_status(400)

      failed_login = JSON.parse(response.body, symbolize_names: true)

      expect(failed_login).to have_key(:error)
      expect(failed_login).to_not have_key(:data)
      expect(failed_login[:error]).to eq('Invalid credentials')
    end

    it 'user password is blank' do
      new_user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers1 = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/users', headers: headers1, params: JSON.generate(new_user_params)

      registered_user = User.last

      login_params = {
        "email": "whatever@example.com",
        "password": ""
      }
      headers = {
        CONTENT_TYPE: "application/json",
        ACCEPT: "application/json"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      expect(response).to have_http_status(400)

      failed_login = JSON.parse(response.body, symbolize_names: true)

      expect(failed_login).to have_key(:error)
      expect(failed_login).to_not have_key(:data)
      expect(failed_login[:error]).to eq('Invalid credentials')
    end
  end
end
