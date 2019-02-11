require "journey"

describe Journey do
  let (:station) {double :station}
  subject{described_class.new(station)}
  it "Stores entry station on creation" do
    expect(subject.entry).to eq station
  end

  it "Exit is nil at the start of the jouney" do
    expect(subject.exit).to eq(nil)
  end
end
