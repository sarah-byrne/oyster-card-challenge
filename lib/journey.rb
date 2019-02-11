class Journey
  attr_reader :entry, :exit
  MIN_FARE = 1
  PENALTY_FARE = 6
  def initialize(station = nil)
    @entry = station
  end

  def end(station)
    @exit = station
    {entry: entry, exit: exit}
  end

  def fare
    return PENALTY_FARE if exit.nil? || entry.nil?
    MIN_FARE
  end

  def in_journey?
    return true if !@entry.nil? && @exit.nil?
    false
  end
end
