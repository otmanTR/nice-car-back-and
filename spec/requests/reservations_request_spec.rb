require 'rails_helper'

RSpec.describe 'Reservations API', type: :request do
  

    context 'with invalid attributes' do
      it 'returns an error' do
        reservation_params = {
          reservation: {
            start_date: nil,
            end_date: '2023-07-05',
            city: 'City A',
            car_id: 1,
            user_id: 1
          }
        }

        post '/api/v1/reservations', params: reservation_params

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)['operation']).to eq('not successful')
        expect(JSON.parse(response.body)['data']['errors']['start_date']).to include("can't be blank")
      end
    end

end