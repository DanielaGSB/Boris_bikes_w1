require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available at docking station' if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'No available space in docking station' if @bikes.count >=20
    @bikes << bike
  end

end
