require "spec_helper"

RSpec.describe Riddler::FlexibleEncoder do
  let(:twos) { [ "this is two", "this is another two" ] }
  let(:encoder) do
    encoder = Riddler::FlexibleEncoder.new
    encoder.add '1' => "that's just one"
    encoder.add '2' => twos
    encoder.add '3' => lambda { "lambda result" }
    encoder
  end

  it "returns string for string value" do
    expect(encoder.encode('1')).to eq("that's just one");
  end

  it "returns one of elements for array" do
    expect(twos).to include encoder.encode('2')
  end

  it "calls block for block value" do
    expect(encoder.encode('3')).to eq "lambda result"
  end
end

