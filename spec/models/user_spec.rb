require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: nil, email: "john@example.com")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(name: "John Doe", email: nil)
    expect(user).to_not be_valid
  end

  it "has many cars" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user.cars).to be_empty

    car1 = Car.create(name: "Tesla Model S", image: "tesla_model_s.jpg", model: "Model S", price: 50000, user: user)
    car2 = Car.create(name: "BMW X5", image: "bmw_x5.jpg", model: "X5", price: 60000, user: user)

    expect(user.cars).to contain_exactly(car1, car2)
  end

  it "has many reservations" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user.reservations).to be_empty

    car = Car.create(name: "Tesla Model S", image: "tesla_model_s.jpg", model: "Model S", price: 50000, user: user)

    reservation1 = Reservation.create(start_date: Date.today, end_date: Date.today + 3, city: "New York", car: car, user: user)
    reservation2 = Reservation.create(start_date: Date.today + 5, end_date: Date.today + 8, city: "Los Angeles", car: car, user: user)

    expect(user.reservations).to contain_exactly(reservation1, reservation2)
  end
end
