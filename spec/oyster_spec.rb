require 'oyster'

describe OysterCard do
  # a double(?) of an OysterCard that has been given the minimum amount required for a journey
  let(:card_min_bal) {OysterCard.new(OysterCard::MINIMUM_AMOUNT)}
  # basic card instance with default starting balance
  let(:card) {OysterCard.new}
  #station double
  let(:station){ double :station }



  it 'shows me my default balance' do
      expect(subject.balance).to eq OysterCard::DEFAULT_BALANCE
  end

  context "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1}.to change{ subject.balance }.by 1
    end

    it "will fail if you try and top up past the maximum balance allowed, #{OysterCard::MAXIMUM_BALANCE}" do
      expect{subject.top_up(OysterCard::MAXIMUM_BALANCE + 1)}.to raise_error "You cant top up more than #{OysterCard::MAXIMUM_BALANCE} balance"
    end
  end

  context "#touch_in" do
    # it { is_expected.to respond_to{:touch_in}

    it 'start the journey' do
      card_min_bal.touch_in(station)
      expect(card_min_bal.in_journey).to eq(true)
    end

    it "if mimimum amount is less than £1 you cannot travel" do
      expect{ card.touch_in(station) }.to raise_error "You cannot travel as you have less than £#{OysterCard::MINIMUM_AMOUNT}"
    end


  end

  # This tests are for test in_journey? instance variable.
  context "#in_journey" do
    it { is_expected.to respond_to(:in_journey) }
  end

  # This tests are for testing touch_out method.
  context "#touch_out" do
    it { is_expected.to respond_to(:touch_out)}

    it 'will change in_journey to false when user touches out' do
      card_min_bal.touch_in(station)
      card_min_bal.touch_out
      expect(card_min_bal.in_journey).to eq(false)
    end

    it 'will deduct the amount from the oyster card' do
      expect{ card.touch_out }.to change{card.balance }.by -OysterCard::MINIMUM_AMOUNT
    end
  end
  # testing stations
  it 'stores the entry station' do
    card_min_bal.touch_in(station)
    expect(card_min_bal.entry_station).to eq station
  end

end
