class Oystercard
  attr_reader :balance
  MAX = 90
  MIN = 1

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    message = "will take card over balance limit #{MAX}"
    fail message if @balance + amount > MAX
    @balance += amount
  end

  def touch_in
    fail "Not enough money for a single journey" if @balance < MIN

    @journey = true
  end

  def touch_out
    @journey = false
    deduct(MIN)
  end

  def in_journey?
    @journey
  end

  private
  def deduct(fare)
    @balance -= fare
  end
end
