require 'station'

describe Station do
  it "has a name" do
    station = Station.new("Paddington", 1)
    expect(station.name).to eq("Paddington")
  end

  it "has a zone" do
    station = Station.new("Paddington", 1)
    expect(station.zone).to eq(2)
  end
end
