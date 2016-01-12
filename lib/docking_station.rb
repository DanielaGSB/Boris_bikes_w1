require_relative 'bike'

class DockingStation
  attr_accessor :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available at docking station' if empty?
    fail 'Broken bike. Cannot release' if bikes.last.broken?
    bikes.pop
  end

  def dock_bike(bike)
    fail 'No available space in docking station' if full?
    bikes << bike
  end

private

attr_reader :bike

  def full?
    bikes.length >= @capacity
  end

  def empty?
    bikes.empty?
  end

end
