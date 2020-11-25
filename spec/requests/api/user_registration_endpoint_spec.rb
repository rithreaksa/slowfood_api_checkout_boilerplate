# frozen_string_literal: true

RSpec.describe 'POST /api/auth/sign_up', type: :request do
  describe 'with valid credentials' do
    before do
      post '/api/auth/',
           params: {
             email: 'thomas@craft.com',
             password: 'password',
             password_confirmation: 'password'
           }
    end

    it {
      expect(response).to have_http_status 200
    }

    it 'is expected to respond with a "status" message' do
      expect(JSON.parse(response.body)['status']).to eq 'success'
    end
  end

  describe 'with invalid credentials' do
    before do
      post '/api/auth/',
           params: {
             email: 'thomas@craft.com',
             password: 'password',
             password_confirmation: 'wrong_password'
           }
    end
    it {
      expect(response).to have_http_status 422
    }

    it 'is expected to respond with a "status" message' do
      expect(JSON.parse(response.body)['status']).to eq 'error'
    end

    it 'is expected to respond with an error message regarding password confirmation' do
      expect(
        JSON.parse(response.body)['errors']['full_messages']
      )
        .to include "Password confirmation doesn't match Password"
    end
  end
end
