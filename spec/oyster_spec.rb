require 'oyster'

describe OysterCard do

# In order to use public transport
# As a customer
# I want money on my card
    it 'shows me my default balance' do
        expect(subject.balance).to eq 0
    end
end
