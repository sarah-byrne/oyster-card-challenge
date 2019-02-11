class Journey
  attr_reader :entry, :exit
  def initialize(station)
    @entry = station
  end

  def end(station)
    @exit = station 
  end
end
