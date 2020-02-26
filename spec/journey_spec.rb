require 'journey'

describe Journey do
  #station double
  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }
  #journey double
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it 'start the journey' do
    card_min_bal.touch_in(entry_station)
    expect(card_min_bal).to be_in_journey
  end

  # testing stations
  it 'stores the entry station' do
    card_min_bal.touch_in(entry_station)
    expect(card_min_bal.entry_station).to eq entry_station
  end

  describe 'touch_in touch_out' do
    before(:each) do
      card_min_bal.touch_in(entry_station)
      card_min_bal.touch_out(exit_station)
    end
    it 'will change in_journey to false when user touches out' do
      expect(card_min_bal).not_to be_in_journey
    end
    it 'returns station value to nil' do
      expect(card_min_bal.entry_station).to eq nil
    end
    it 'records previous journeys' do
      expect(card_min_bal.journeys).to include journey
    end
  end

  it { expect(subject.journeys).to eq [] }
end
