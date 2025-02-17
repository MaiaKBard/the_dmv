require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    it 'exists' do
        expect(@factory).to be_a(VehicleFactory)
    end

    it "can create vehicles from WA EV registrations" do
        vehicles = @factory.create_vehicles(@wa_ev_registrations)

        expect(vehicles).to be_a(Array)
        expect(vehicles.first).to be_a(Vehicle)


        expect(vehicles.first.vin).to eq(@wa_ev_registrations.first[:vin_1_10])
        expect(vehicles.first.make).to eq(@wa_ev_registrations.first[:make])
        expect(vehicles.first.model).to eq(@wa_ev_registrations.first[:model])
        expect(vehicles.first.year).to eq(@wa_ev_registrations.first[:model_year].to_i)
        expect(vehicles.first.engine).to eq(:ev)
    end

end 