require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) {described_class.new}
  let(:bike) {double(:bike, broken?: false)}

  describe('#release_bike')
    it {is_expected.to respond_to(:release_bike)}

    it 'releases a bike' do
      docking_station.dock_bike(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises error if the bike is broken' do
      bike = double(:bike, broken?: true)
      docking_station.dock_bike(bike)
      expect{docking_station.release_bike}.to raise_error 'Broken bike. Cannot release'
    end

    it 'raises an error if bikes are not available' do
      expect{docking_station.release_bike}.to raise_error('No bikes available at docking station')
    end

  describe('#dock_bike')
    it {is_expected.to respond_to(:dock_bike).with(1).argument}

    # it 'docks working bikes' do
    #   bike = Bike.new
    #   subject.dock_bike(bike)
    #   expect(subject.bikes).to include(bike)
    # end

    it 'raises an error if no space in docking station' do
      docking_station.capacity.times {docking_station.dock_bike(bike)}
      expect{docking_station.dock_bike(bike)}.to raise_error('No available space in docking station')
    end

  describe('#initialize')
    it 'ensures default capacity is set to 20 when no parameters are passed' do
      expect(docking_station.capacity).to eq(described_class::DEFAULT_CAPACITY)
    end

    it 'has a variable capacity' do
      docking_station = described_class.new(40)
      expect(docking_station.capacity).to eq(40)
    end
  end
