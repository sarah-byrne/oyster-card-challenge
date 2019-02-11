class Journey
  attr_reader :entry, :exit
  MIN_FARE = 1

  def initialize(station)
    @entry = station
  end

  def end(station)
    @exit = station
  end

  def fare
    MIN_FARE
  end
end
