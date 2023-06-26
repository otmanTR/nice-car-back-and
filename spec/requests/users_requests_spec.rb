require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /api/v1/users' do
    it 'creates a new user' do
      user_params = {
        name: 'John Doe',
        email: 'john@example.com'
      }

      post '/api/v1/users', params: { user: user_params }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['operation']).to eq('user created successfully')
      expect(User.last.name).to eq('John Doe')
      expect(User.last.email).to eq('john@example.com')
    end

    it 'returns an error for invalid user' do
      user_params = {
        name: '',
        email: 'john@example.com'
      }

      post '/api/v1/users', params: { user: user_params }

      expect(response).to have_http_status(:bad_request)
      expect(JSON.parse(response.body)['operation']).to eq('not successful')
      expect(JSON.parse(response.body)['data']['errors']['name']).to include("can't be blank")
    end
  end
end
