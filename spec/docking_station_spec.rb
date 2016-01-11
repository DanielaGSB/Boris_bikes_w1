require 'docking_station'

describe DockingStation do

  describe('#release_bike')
    it {is_expected.to respond_to(:release_bike)}

    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error if bikes are not available' do
      expect{subject.release_bike}.to raise_error('No bikes available at docking station')
    end

  describe('#dock_bike')
    it {is_expected.to respond_to(:dock_bike).with(1).argument}

    # it 'docks working bikes' do
    #   subject.dock_bike(Bike.new)
    #   expect(subject.bikes).to include(Bike.new)
      #
      # bike = Bike.new
      # subject.release_bike
      # expect(subject.dock_bike(bike)).to eq bike
  

    it 'raises an error if no space in docking station' do
      20.times {subject.dock_bike(Bike.new)}
      expect{subject.dock_bike(Bike.new)}.to raise_error('No available space in docking station')
    end

end
