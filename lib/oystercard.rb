class Oystercard
  attr_reader :balance 
  LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "will take card over balance limit #{LIMIT}" if maximum?(amount)
    @balance += amount
  end

  private
  def maximum?(amount)
    @balance + amount > LIMIT
  end
end
