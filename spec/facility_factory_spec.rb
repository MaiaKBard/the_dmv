require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new

        #I need to load data from each factory to be used through the test...
        @co_dmv_data = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_data = DmvDataService.new.mo_dmv_office_locations
        @co_facilities = @factory.create_facilities(@co_dmv_data, co_mapper)
        @ny_facilities = @factory.create_facilities(@ny_dmv_data, ny_mapper)
        @mo_facilities = @factory.create_facilities(@mo_dmv_data, mo_mapper)
    end

    it 'exists' do
        expect(@factory).to be_a(FacilityFactory)
    end

    describe '#Colorado DMV' do
        it 'creates DMVFacility objects from CO DMV data' do
            expect(@co_facilities).to be_an(Array)
            expect(@co_facilities.first).to be_a(DMVFacility)
        end

        it 'assigns correct attributes' do
            facility = @co_facilities.first

            expect(facility.name).to eq(@co_dmv_data.first[:dmv_office])
            expect(facility.address).to eq("#{@co_dmv_data.first[:address_li]}, #{@co_dmv_data.first[:city]}, #{@co_dmv_data.first[:state]} #{@co_dmv_data.first[:zip]}")
            expect(facility.phone).to eq(@co_dmv_data.first[:phone])
            expect(facility.services).to eq(@co_dmv_data.first[:services_p])
        end
    end

    describe '#New York DMV' do
        it 'creates DMVFacility objects from CO DMV data' do
            expect(@ny_facilities).to be_an(Array)
            expect(@ny_facilities.first).to be_a(DMVFacility)
        end

        it 'assigns correct attributes' do
            facility = @ny_facilities.first

            expect(facility.name).to eq(@ny_dmv_data.first[:office_name])
            expect(facility.address).to eq("#{@ny_dmv_data.first[:street_address_line_1]}, #{@ny_dmv_data.first[:city]}, #{@ny_dmv_data.first[:state]} #{@ny_dmv_data.first[:zip_code]}")
            expect(facility.phone).to eq(@ny_dmv_data.first[:phone])
            expect(facility.services).to eq(@ny_dmv_data.first[:services_p])
        end
    end

    describe '#Missouri DMV' do
        it 'creates DMVFacility objects from CO DMV data' do
            expect(@mo_facilities).to be_an(Array)
            expect(@mo_facilities.first).to be_a(DMVFacility)
        end

        it 'assigns correct attributes' do
            facility = @mo_facilities.first

            expect(facility.name).to eq("DMV Missing Fields")
            expect(facility.address).to eq("#{@mo_dmv_data.first[:address1]}, #{@mo_dmv_data.first[:city]}, #{@mo_dmv_data.first[:state]} #{@mo_dmv_data.first[:zipcode]}")
            expect(facility.phone).to eq(@mo_dmv_data.first[:phone])
            expect(facility.services).to eq(@mo_dmv_data.first[:services_p])
        end
    end

    describe '#missing data' do
        it 'returns an empty array when data is not given' do
            empty_facilities = @factory.create_facilities([], co_mapper)
            expect(empty_facilities).to eq([])
        end

        it 'runs with missing feilds' do 
            incomplete_data = [{facility_name: "DMV Missing Fields" }]
            facilities = @factory.create_facilities(incomplete_data, mo_mapper)

            facility = facilities.first

            expect(facility.name).to eq("DMV Missing Fields")
            expect(facility.address).to eq("#{incomplete_data.first[:address_li].to_s.strip}, #{incomplete_data.first[:city].to_s.strip}, #{incomplete_data.first[:state].to_s.strip} #{incomplete_data.first[:zip].to_s.strip}")
            expect(facility.phone).to eq(nil)
            expect(facility.services).to eq(nil)
        end
    end
end