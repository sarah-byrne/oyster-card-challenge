require "oystercard"

describe Oystercard do
  it "has a balance of 0 when created" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end
end
