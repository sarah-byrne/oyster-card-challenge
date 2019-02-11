class Oystercard
  attr_reader :balance
  LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    message = "will take card over balance limit #{LIMIT}"
    fail message if @balance + amount > LIMIT
    @balance += amount
  end

end
