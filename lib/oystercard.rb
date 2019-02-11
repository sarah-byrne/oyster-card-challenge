class Oystercard
  attr_reader :balance
  LIMIT = 90
  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    message = "will take card over balance limit #{LIMIT}"
    fail message if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end
end
