require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    fail 'No bikes available at docking station' unless @bike
    @bike
  end

  def dock_bike(bike)
    fail 'No available space in docking station' if @bike
    @bike = bike
  end

end
