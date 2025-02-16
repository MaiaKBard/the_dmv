require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    it 'exists' do
        expect(@factory).to be_a(VehicleFactory)
    end

    

end 