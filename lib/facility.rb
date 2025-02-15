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
      elsif vehicle.engine == "ev"
        200
      else 
        100
      end
    end
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    
    @registered_vehicles << vehicle
  end

end
