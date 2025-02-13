require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do 
        @registrant = Registrant.new('Bruce', 18, true )
        
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    it 'exists' do
        expect(@registrant).to be_a(Registrant)
    end

    it 'has a name' do
        expect(@registrant.name).to eq("Bruce")
    end

    it 'has an age' do
        expect(@registrant.age).to eq(18)
    end

    it 'has a permit' do
        expect(@registrant.permit?).to eq(true)
    end

    it 'contains data on license' do
        expect(@registrant.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can earn a permit' do
        expect(@registrant_2.permit?).to eq(false)
        @registrant_2.earn_permit
        expect(@registrant_2.permit).to eq(true)
    end
end