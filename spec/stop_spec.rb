require 'spec_helper'

describe Stop do 
  line1 = Line.new('line_name' => 'red')
  line1.save
  line2 = Line.new('line_name' => 'green')
  line2.save
  station1 = Station.new('station_name' => 'uptown')
  station1.save
  station2 = Station.new('station_name' => 'downtown')
  station2.save

  context '#initialize' do
    it 'initializes an instance of stop' do
        line1 = Line.new('line_name' => 'red')
  line1.save
  line2 = Line.new('line_name' => 'green')
  line2.save
  station1 = Station.new('station_name' => 'uptown')
  station1.save
  station2 = Station.new('station_name' => 'downtown')
  station2.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id).should be_an_instance_of Stop
    end
  end

  context 'readers' do
    it 'returns the value for stop_name' do
        line1 = Line.new('line_name' => 'red')
        line1.save
        line2 = Line.new('line_name' => 'green')
        line2.save
        station1 = Station.new('station_name' => 'uptown')
        station1.save
        station2 = Station.new('station_name' => 'downtown')
        station2.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop.save
      puts stop
      stop.line_name.should eq 'red'
      #stop.station_name.should eq 'Uptown'
    end
  end

  context '#save' do 
    it 'saves and adds a stop with a line and station to the db' do 
        line1 = Line.new('line_name' => 'red')
  line1.save
  line2 = Line.new('line_name' => 'green')
  line2.save
  station1 = Station.new('station_name' => 'uptown')
  station1.save
  station2 = Station.new('station_name' => 'downtown')
  station2.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop.save
      Stop.all.should eq [stop]
    end
  end

  context '.all' do 
    it 'displays all the stops' do 
        line1 = Line.new('line_name' => 'red')
  line1.save
  line2 = Line.new('line_name' => 'green')
  line2.save
  station1 = Station.new('station_name' => 'uptown')
  station1.save
  station2 = Station.new('station_name' => 'downtown')
  station2.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop.save
      puts Stop.all
      # Stop.all.map {|input| input}.should =~ [stop]
    end 
  end

  context '#==' do
    it 'considers two objects equal if their stop are equal' do
        line1 = Line.new('line_name' => 'red')
  line1.save
  line2 = Line.new('line_name' => 'green')
  line2.save
  station1 = Station.new('station_name' => 'uptown')
  station1.save
  station2 = Station.new('station_name' => 'downtown')
  station2.save
      stop1 = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop2 = Stop.new('line_id' => line2.line_id, 'station_id' => station2.station_id)
      stop1.save
      stop2.save
    end
  end
end