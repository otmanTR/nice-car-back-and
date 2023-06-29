require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com') }

  subject(:car) do
    described_class.new(
      name: 'Tesla Model S',
      image: 'tesla_model_s.jpg',
      model: 'Model S',
      price: 50_000,
      user: user
    )
  end

  it 'is valid with valid attributes' do
    expect(car).to be_valid
  end

  it 'is not valid without a name' do
    car.name = nil
    expect(car).to_not be_valid
  end

  it 'is not valid with a name shorter than 3 characters' do
    car.name = 'Te'
    expect(car).to_not be_valid
    expect(car.errors[:name]).to include('Name must have 3 or more characters')
  end

  it 'is not valid without an image' do
    car.image = nil
    expect(car).to_not be_valid
  end

  it 'is not valid without a model' do
    car.model = nil
    expect(car).to_not be_valid
  end

  it 'is not valid without a price' do
    car.price = nil
    expect(car).to_not be_valid
  end

  it 'is not valid with a price of 0' do
    car.price = 0
    expect(car).to_not be_valid
    expect(car.errors[:price]).to include('Price must be greater than 0')
  end

  it 'is valid with a user association' do
    expect(car.user).to eq(user)
  end

  it 'destroys the associated reservation when destroyed' do
    reservation = Reservation.create(car: car, user: user) # Updated this line to pass the car and user objects
    car.destroy
    expect(Reservation.exists?(reservation.id)).to be false
  end
end
