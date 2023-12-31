require 'rails_helper'
RSpec.describe Reservation, type: :model do
  let(:car) { Car.create(name: 'Tesla Model S', image: 'tesla_model_s.jpg', model: 'Model S', price: 50_000) }
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com') }
  subject(:reservation) do
    described_class.new(
      start_date: Date.today + 1,
      end_date: Date.today + 5,
      city: 'New York',
      car: car,
      user: user
    )
  end
  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end
  it 'is not valid without a start_date' do
    reservation.start_date = nil
    expect(reservation).to_not be_valid
  end
  it 'is not valid without an end_date' do
    reservation.end_date = nil
    expect(reservation).to_not be_valid
  end
  it 'is not valid without a city' do
    reservation.city = nil
    expect(reservation).to_not be_valid
  end
  it 'has a car association' do
    expect(reservation.car).to eq(car)
  end
  it 'has a user association' do
    expect(reservation.user).to eq(user)
  end
end
