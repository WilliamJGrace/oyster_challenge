require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1}
  let(:card) {double :card}

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  #Below are old tests before I changed Journey and Oyster

  # context 'given an entry station' do
  #   subject {described_class.new(:station)}
  #   it 'has an entry station' do
  #    expect(subject.entry_station).to eq station
  #   end
  #   it "returns a penalty fare if no exit station given" do
  #     expect(subject.fare).to eq Journey::PENALTY_FARE
  #   end
  # end
   # context 'given an exit station' do
   #   let(:exit_station) { double :exit_station }
   #
   #      before do
   #        subject.finish(other_station)
   #      end
   # end
end
