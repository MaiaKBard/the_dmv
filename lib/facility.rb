class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
    current_year = Time.now.year

    @registered_vehicles.sum do |vehicle|
      if current_year - vehicle.year >= 25
        25
      elsif vehicle.engine == :ev
        200
      else 
        100
      end
    end
  end

  def register_vehicle(vehicle)
    return unless @services.include?('Vehicle Registration')
    
    vehicle.registration_date = Date.today
    current_year = Time.now.year
      if current_year - vehicle.year >= 25
        vehicle.plate_type = :antique
      elsif vehicle.engine == :ev
        vehicle.plate_type = :ev
      else
        vehicle.plate_type = :regular
    end
    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test') && 
    registrant.age >= 16 && 
    registrant.permit

    registrant.license_data[:written] = true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') && registrant.license_data[:written]
    registrant.license_data[:license] = true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License') && registrant.license_data[:license]
    registrant.license_data[:renewed] = true
  end
end
