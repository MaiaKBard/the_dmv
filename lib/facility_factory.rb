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

#mappers for each state
def co_mapper 
  lambda do |data|
    DMVFacility.new(
        name: data[:dmv_office] || "DMV Missing Fields",
        address: "#{data[:address_li] || ''}, #{data[:city] || ''}, #{data[:state] || ''} #{data[:zip] || ''}",
        phone: data[:phone] || nil,
        services: data[:services_p] || nil
    )
  end
end

def ny_mapper
  lambda do |data|
    DMVFacility.new(
        name: data[:office_name] || "DMV Missing Fields",
        address: "#{data[:street_address_line_1] || ''}, #{data[:city] || ''}, #{data[:state] || ''} #{data[:zip_code] || ''}",
        phone: data[:phone] || nil,
        services: data[:services_p] || nil
    )
  end
end

def mo_mapper
  lambda do |data|
    DMVFacility.new(
        name: data[:dmv_office] || "DMV Missing Fields",
        address: "#{data[:address1] || ''}, #{data[:city] || ''}, #{data[:state] || ''} #{data[:zipcode] || ''}",
        phone: data[:phone] || nil,
        services: data[:services_p] || nil
    )
  end
end
