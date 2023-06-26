require 'rails_helper'

RSpec.describe 'Cars API', type: :request do
  let(:user) { User.create(name: 'John Doe', email: 'ab@gmail.com') }

  describe 'GET /api/v1/cars' do
    it 'returns a list of cars' do
      car = Car.create(name: 'Tesla Model S', image: 'tesla.jpg', model: 'Model S', price: 50000, user: user)

      get '/api/v1/cars'
      
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)[0]['name']).to eq('Tesla Model S')
    end
  end

  describe 'POST /api/v1/cars' do
    it 'creates a new car' do
      car_params = { name: 'Tesla Model 3', image: 'tesla.jpg', model: 'Model 3', price: 40000, user_id: user.id }

      post '/api/v1/cars', params: { car: car_params }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['name']).to eq('Tesla Model 3')
    end

  end

  describe 'PATCH /api/v1/cars/:id' do
    it 'updates an existing car' do
      car = Car.create(name: 'Tesla Model S', image: 'tesla.jpg', model: 'Model S', price: 50000, user: user)
      updated_name = 'Tesla Model X'

      patch "/api/v1/cars/#{car.id}", params: { car: { name: updated_name } }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).to eq(updated_name)
    end
  end
end