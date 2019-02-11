require "oystercard"

describe Oystercard do
  let(:station) {double :station}
  let(:station2) {double :station2}

  before :each do
    @card = Oystercard.new
    @card.top_up(10)
  end
  it "has a balance of 0 when created" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it "Tops up the card by 10 from 10" do
    @card.top_up(10)
    expect(@card.balance).to eq 20
  end

  it "Tops up the card by 20 from 10" do
    @card.top_up(20)
    expect(@card.balance).to eq 30
  end

  it "raises an error if topping up goes over the limit" do
    message = "will take card over balance limit #{Oystercard::MAX}"
    expect { @card.top_up(Oystercard::MAX + 1) }.to raise_error(message)
  end

  it "is not in the middle of a journey when created" do
    expect(@card.in_journey?).to eq(false)
  end

  it "is in a journey after touching in" do
    @card.touch_in(station)
    expect(@card.in_journey?).to eq(true)
  end

  it "is not in a journey after touching out" do
    @card.touch_out(station)
    expect(@card.in_journey?).to eq(false)
  end

  it "Dosen't let you touch in when you have less then 1 balance" do
    card = Oystercard.new
    expect { card.touch_in(station) }.to raise_error("Not enough money for a single journey")
  end

  it "deducts minimum fare from balance when touching out" do
    @card.touch_in(station)
    expect { @card.touch_out(station2) }.to change{ @card.balance }.by(- Oystercard::MIN)
  end

  it "Logs the entrance station on touch in" do
    @card.touch_in(station)
    expect(@card.entry_station).to eq station
  end

  it "forgets the entry station on touch out" do
    @card.touch_in(station)
    @card.touch_out(station2)
    expect(@card.entry_station).to eq(nil)
  end

  it "Logs the exit station on touch out" do
    @card.touch_in(station)
    @card.touch_out(station2)
    expect(@card.exit_station).to eq station2
  end
end
