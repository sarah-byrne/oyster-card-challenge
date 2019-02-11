require "oystercard"

describe Oystercard do
  before :each do
    @card = Oystercard.new
  end
  it "has a balance of 0 when created" do
    expect(@card.balance).to eq(0)
  end

  it "Tops up the card by 10 from 0" do
    @card.top_up(10)
    expect(@card.balance).to eq 10
  end

  it "Tops up the card by 20 from 0" do
    @card.top_up(20)
    expect(@card.balance).to eq 20
  end

  it "raises an error if topping up goes over the limit" do
    expect { @card.top_up(Oystercard::LIMIT + 1) }.to raise_error("will take card over balance limit #{Oystercard::LIMIT}")
  end

  it "deducts 4 from balance for a long fare" do
    @card.top_up(10)
    @card.deduct(4)
    expect(@card.balance).to eq 6
  end

  it "deducts 2 from the balance for a short fare" do
    @card.top_up(10)
    @card.deduct(2)
    expect(@card.balance).to eq 8
  end
end
