require 'airport'
require 'plane'

 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  context 'taking off and landing' do
    it 'a plane can land' do
      set_weather_sunny
      airport.land(plane)
      expect(plane.status).to eq(:landed)      
    end
    
   it 'a plane can take off' do
     set_weather_sunny
      airport.take_off(plane)
      expect(plane.status).to eq(:flying)  
    end
  end

  context 'has' do 

    it 'a default capacity of 10 planes' do
        expect(airport.capacity).to eq(10)
    end
  end
  context 'traffic control' do
    it 'the usage of the aiport should increase and decrease  when a plane take off or land' do
     set_weather_sunny
     airport.land(plane)
     expect(airport.planes.length).to eq(1)
     airport.take_off(plane)
     expect(airport.planes.length).to eq(0)
   end

    it 'a plane cannot land if the airport is full' do
      land_planes(15)
      expect(airport.planes.length).to eq(10)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
      airport.stub(:current_weather){:sunny}
      airport.land(plane)
      airport.stub(:current_weather){:stormy}
      expect(airport.planes.length).to eq(1)
      airport.take_off(plane)
     expect(airport.planes.length).to eq(1)

     end
      
      it 'a plane cannot land in the middle of a storm' do
      airport.stub(:current_weather){:stormy}
      expect(airport.planes.length).to eq(0)
      end
    end
  end
end
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane.status).to eq(:flying)
  end
  
  it 'has a flying status when in the air' do
    plane.status = :flying
    expect(plane.status).to eq(:flying)
  end
  
  it 'can take off' do
    plane.take_off!
    expect(plane.status).to eq(:flying)
  end
  
  it 'changes its status to flying after taking off' do
    plane.take_off!
    expect(plane.status).to eq(:flying)
  end
end
 
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The grand finale (last spec)" do
  let(:airport) { Airport.new }
  it 'all planes can land and all planes can take off' do
    airport.capacity = 6
    land_planes(6)
    expect(airport.planes.select{|plane| plane.status = :landed}.length).to be_within(3).of(3)
    take_off_planes(6)
    expect(airport.planes.select{|plane| plane.status = :flying}.length).to be_within(3).of(3)
  end
end


def land_planes(instance)
 instance.times do 
    set_weather_sunny
    airport.land(Plane.new)
  end
end
def land_planes_weather(instance)
 instance.times do 
    airport.land(Plane.new)
  end
end

def take_off_planes(instance)
  instance.times do 
    airport.take_off(Plane.new)
  end
end

def set_weather_sunny
  airport.stub(:current_weather){:sunny}
end