class VehicleFactory 
  
    def create_vehicles(registration_data)
    
        registration_data.map do |data|
           Vehicle.new(
                vin: data[:vin_1_10],
                make: data[:make],
                model: data[:model],
                year: data[:model_year].to_i,
                engine: :ev
            )
        end
    end
end