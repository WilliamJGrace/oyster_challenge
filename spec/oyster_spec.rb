require 'oyster'

describe OysterCard do

# In order to use public transport
# As a customer
# I want money on my card
  it 'shows me my default balance' do
      expect(subject.balance).to eq OysterCard::DEFAULT_BALANCE
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1}.to change{ subject.balance }.by 1
  end

  it "will fail if you try and top up past the maximum balance allowed, #{OysterCard::MAXIMUM_BALANCE}" do
    expect{subject.top_up(91)}.to raise_error "You cant top up more than #{OysterCard::MAXIMUM_BALANCE} balance"
  end



  # This test is to check the response of touchin method.
  context "#touch_in" do
    it { is_expected.to respond_to(:touch_in) }

    it 'start the journey' do
      card = OysterCard.new(OysterCard::MINIMUM_AMOUNT)
      card.touch_in
      expect(card.in_journey).to eq(true)
    end

    it "if mimimum amount is less than £1 you cannot travel" do
      card = OysterCard.new
      expect{ card.touch_in }.to raise_error "You cannot travel as you have less than £#{OysterCard::MINIMUM_AMOUNT}"

    end

    it 'remembers where i touch in' do
      card = OysterCard.new(1)
      # allow(card).to receive(:touch_in) { true }
      card.touch_in
      expect(card.entry_station).to eq "barbican"
    end

  end


  it 'remembers where i touch in' do
    card = OysterCard.new(1)
    # allow(card).to receive(:touch_in) { true }
    card.touch_in
    expect(card.entry_station).to eq "barbican"
end


  # This tests are for test in_journey? method.

  it { is_expected.to respond_to(:in_journey) }






  # This tests are for testing touch_out method.

  it { is_expected.to respond_to(:touch_out)}

  it 'Finish' do
    card = OysterCard.new(OysterCard::MINIMUM_AMOUNT)
    card.touch_in
    card.touch_out
    expect(card.in_journey).to eq(false)
  end

  it 'will deduct the amount from the oyster card' do

    card = OysterCard.new
    expect{ card.touch_out }.to change{card.balance }.by -1
    end

end
