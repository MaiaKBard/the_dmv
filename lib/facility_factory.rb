class FacilityFactory
    def create_facilities(dmv_data)
        dmv_data.map do |data|
            DMVFacility.new(
                name: data[:dmv_office],
                address: "#{data[:address_li]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
                phone: data[:phone],
                services: data[:services_p]
            )
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