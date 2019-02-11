require "oystercard"

describe Oystercard do
  it "has a balance of 0 when created" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it "Tops up the card by 10 from 0" do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eq 10
  end

  it "Tops up the card by 20 from 0" do
    card = Oystercard.new
    card.top_up(20)
    expect(card.balance).to eq 20
  end
end
