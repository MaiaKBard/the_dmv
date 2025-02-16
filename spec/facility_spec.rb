require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

    it 'can add servies per facility' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['Vehicle Registration'])
    end

    it 'has each facility hold their registered vehicles' do
      expect(@facility.registered_vehicles).to eq([])
    end

    it 'can collect fees' do
      expect(@facility.collected_fees).to eq(0)
    end

    it 'can register a vehicle, update registration date, and add plate type' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      
      expect(@facility.registered_vehicles).to eq([@cruz, @bolt])
      expect(@cruz.registration_date).to be_a(Date)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'can not perform services unless they are added to a facility' do
      @facility_2.register_vehicle(@cruz)
      @facility_2.collected_fees

      expect(@facility_2.register_vehicle(@cruz)).to be nil
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.collected_fees).to eq(0)

      @facility_2.add_service('Vehicle Registration')

      @facility_2.register_vehicle(@cruz)
      @facility_2.collected_fees

      expect(@facility_2.registered_vehicles).to eq([@cruz])
      expect(@facility_2.services).to eq(["Vehicle Registration"])
      expect(@facility_2.collected_fees).to eq(100)
    end
  end

   describe '#written test' do
      it 'can display license data' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'can detect a permit' do
        expect(@registrant_1.permit?).to eq(true)
      end

      it 'a facility can administer written test to a registrant' do
        @facility.add_service('Written Test')
        expect(@facility.services).to eq(['Written Test'])

        expect(@facility.administer_written_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "can only administer the test if facility has the service" do

        expect(@facility.services).to eq([])
        expect(@facility.administer_written_test(@registrant_1)).to eq(false)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  
        @facility.add_service('Written Test')
        expect(@facility.services).to eq(['Written Test'])

        expect(@facility.administer_written_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end
    end

    describe '#road test' do
      it 'can only adminster road test if registrant passed written test' do
      # binding.pry
        @facility.add_service('Written Test')
        @facility.add_service('Road Test')
        @facility.administer_written_test(@registrant_1)

        expect(@facility.administer_road_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({ written: true, license: true, renewed: false })

        @facility.add_service('Written Test')
        @facility.add_service('Road Test')
        @facility.administer_written_test(@registrant_3)
      #  binding.pry
        expect(@facility.administer_road_test(@registrant_3)).to eq(false)
        expect(@registrant_3.license_data).to eq({ written: false, license: false, renewed: false })
      end

      it 'a facility can administer road test to a registrant' do
        # binding.pry
        @facility.add_service('Written Test')
        @facility.add_service('Road Test')
        expect(@facility.services).to eq(['Written Test', 'Road Test'])

        expect(@facility.administer_written_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

        expect(@facility.administer_road_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

      it "can only administer the test if facility has the service" do

        @facility.add_service('Written Test')
        expect(@facility.services).to eq(['Written Test'])

        expect(@facility.administer_written_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        expect(@facility.administer_road_test(@registrant_1)).to eq(false)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

        @facility.add_service('Road Test')
        expect(@facility.services).to eq(['Written Test', 'Road Test'])

        expect(@facility.administer_road_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end
end
