require 'rails_helper'
  # pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it { should respond_to :model }
    it { should respond_to :price }
    it { should respond_to :color }
    it { should respond_to :interior }
    it { should respond_to :mileage }
    # it { should respond_to :runs } 
    it { should respond_to :make }
    end

    describe 'validations' do
      # it 'validates presence of make' do
      #   car = Car.create(model: 'Prius')
      #   expect(car).to_not be persisted
      # NOT FINSIHED but similar way to do whats below

      it { should validate_presence_of :make }
      it { should validate_uniqueness_of :make }
    end

    describe 'filtering' do
      before(:each) do
          @car1 = Car.create({ make: 'Toyota', model: 'Prius', price: 20000 })
          @car2 = Car.create({ make: 'Ford', model: 'F-150', price: 19099 })
          @car3 = Car.create({ make: 'Abe', model: 'Linc', price: 19000 })
      end

      it 'sorts by model ASC' do
        cars = Car.by_model # this fails initially bc we havn't written the ny_model method.
        expect(cars.first).to eq(@car2)
        expect(cars.last).to eq(@car1)
      end

      it 'sorts by price ASC' do
        cars = Car.by_price
        expect(cars.first).to eq(@car3)
        expect(cars.last).to eq(@car1)
      end

      it 'sorts by price DESC' do
        cars = Car.by_price(:desc)
        expect(cars.first).to eq(@car1)
        expect(cars.last).to eq(@car3)
      end
    end

    describe 'behavior' do
      before(:each) do
        @attrs = {
          make: 'Toyota',
          model: 'Tacoma',
          color: 'green',
          price: 9000
        }
        @car = Car.create(@attrs)
      end

      it 'can be painted' do
        color = 'rainbow'
        @car.paint(color)
        expect(@car.color).to eq(color)
      end

      it 'honks' do
        expect(@car.honk).to eq('BEEP BEEP')
      end

      it 'displays info' do
        expect(@car.info).to eq(@attrs)
      end
    end

    describe 'dont run this test right now' do
      it 'should fail' do
        expect(true).to be(false)
      end
    end
end
# it { should respond_to :make }
    # ^ replaces the next 4 lines of code.
    # it 'has a make' do
    #   make = 'Toyota' # expected = 'Toyota'
    #   car = Car.create(make: make) # actual = Car.create(make: expected)
    #   expect(car.make).to eq(make) # expect(a    ctual.make).to eq(expected)
