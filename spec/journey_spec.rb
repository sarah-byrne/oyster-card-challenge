require "journey"

describe Journey do
  let (:station) {double :station}
  subject{described_class.new(station)}
  it "Stores entry station on creation" do
    expect(subject.entry).to eq station
  end

  it "Exit is nil at the start of the journey" do
    expect(subject.exit).to eq(nil)
  end

  it "stores an exit station" do
    subject.end(station)
    expect(subject.exit).to eq station
  end

  it "Calculates fare as the minimum fare if journey complete" do
    subject.end(station)
    expect(subject.fare).to eq Journey::MIN_FARE
  end

  it "calculates fare as the penalty fare if journey info incomplete" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "Returns a hash containg the entry and exit stations" do
    subject.end(station)
    expect(subject.end).to eq({entry: station, exit: station})
  end
end
