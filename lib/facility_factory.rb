class FacilityFactory
    def create_facilities(dmv_data, state_mapper)
        dmv_data.map do |data|
           state_mapper.call(data)
        end
    end
end

class DMVFacility
    attr_reader :name, :address, :phone, :services

    def initialize(name:, address:, phone:, services:)
        @name = name
        @address = address
        @phone = phone
        @services = services
    end
end