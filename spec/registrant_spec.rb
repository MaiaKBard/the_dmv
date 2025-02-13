require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do 
        @registrant = Registrant.new('Bruce', 18, true )
        
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    it 'exists' do


    end
end