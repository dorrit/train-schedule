require 'spec_helper'

describe Station do 

  context '#initialize' do
    it 'initializes an instance of station' do 
      station = Station.new('station_name' => 'uptown').should be_an_instance_of Station
    end
  end

  context 'readers' do
    it 'returns the value for station_name' do
      station = Station.new('station_name' => 'uptown')
      station.station_name.should eq 'uptown'
    end
  end

  context '#save' do 
    it 'adds a station to the db' do 
      station = Station.new('station_name' => 'uptown')
      station.save
      Station.all.should eq [station]
    end
  end

  context '.all' do 
    it 'displays all the stations' do 
      station = Station.new('station_name' => 'downtown')
      station2 = Station.new('station_name' => 'uptown')
      station.save
      station2.save
      Station.all.map {|input| input}.should =~ [station, station2]
    end 
  end

  context '#==' do
    it 'considers two objects equal if their station_names are equal' do
      station1 = Station.new('station_name' => 'midtown')
      station2 = Station.new('station_name' => 'midtown')
      station1.should eq station2
    end
  end
end