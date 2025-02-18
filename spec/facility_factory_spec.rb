require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @co_dmv_data = DmvDataService.new.co_dmv_office_locations
        @facilities = @factory.create_facilities(@co_dmv_data)
    end

    it 'exists' do
        expect(@factory).to be_a(FacilityFactory)
    end

    it 'creates DMVFacility objects from CO DMV date' do
        expect(@facilities).to be_an(Array)
        expect(@facilities.first).to be_a(DMVFacility)
    end

    it 'assigns correct attributes' do
        facility = @facilities.first

        expect(facility.name).to eq(@co_dmv_data.first[:dmv_office])
        expect(facility.address).to eq("#{@co_dmv_data.first[:address_li]}, #{@co_dmv_data.first[:city]}, #{@co_dmv_data.first[:state]} #{@co_dmv_data.first[:zip]}")
        expect(facility.phone).to eq(@co_dmv_data.first[:phone])
        expect(facility.services).to eq(@co_dmv_data.first[:services_p])
    end
end