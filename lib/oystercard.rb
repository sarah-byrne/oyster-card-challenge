class Oystercard
  attr_reader :balance, :entry_station, :exit_station
  MAX = 90
  MIN = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    message = "will take card over balance limit #{MAX}"
    fail message if @balance + amount > MAX
    @balance += amount
  end

  def touch_in(station)
    fail "Not enough money for a single journey" if @balance < MIN
    @entry_station = station
  end

  def touch_out(station)
    @entry_station = nil
    @exit_station = station
    deduct(MIN)
  end

  def in_journey?
    !@entry_station.nil?
  end

  private
  def deduct(fare)
    @balance -= fare
  end
end
