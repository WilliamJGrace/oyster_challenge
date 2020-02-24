require 'oyster'

describe OysterCard do

# In order to use public transport
# As a customer
# I want money on my card
    it 'shows me my default balance' do
        expect(subject.balance).to eq OysterCard::DEFAULT_BALANCE
    end

    it 'top up the oyster card balance' do
      num = 9
      expect(subject.top_up(num)).to eq num
    end
end
