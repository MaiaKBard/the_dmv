require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new

        #I need to load data from each factory to be used through the test...
        @co_dmv_data = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_data = DmvDataService.new.mo_dmv_office_locations

        #mapper for each differnt state
        @co_mapper = lambda do |data|
            DMVFacility.new(
                name: data[:dmv_office],
                address: "#{data[:address_li]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
                phone: data[:phone],
                services: data[:services_p]
            )
        end

        @ny_mapper = lambda do |data|
            DMVFacility.new(
                name: data[:dmv_office],
                address: "#{data[:address_li]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
                phone: data[:phone],
                services: data[:services_p]
            )
        end

        @mo_mapper = lambda do |data|
            DMVFacility.new(
                name: data[:dmv_office],
                address: "#{data[:address_li]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
                phone: data[:phone],
                services: data[:services_p]
            )
        end

        #creating facilities including the mapper instance
        @co_facilities = @factory.create_facilities(@co_dmv_data, @co_mapper)
        @ny_facilities = @factory.create_facilities(@ny_dmv_data, @ny_mapper)
        @mo_facilities = @factory.create_facilities(@mo_dmv_data, @mo_mapper)

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