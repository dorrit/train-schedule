require 'spec_helper'

describe Stop do 

  context '#initialize' do
    it 'takes the attributes as an argument' do
      line1 = Line.new('line_name' => 'red')
      line1.save
      station1 = Station.new('station_name' => 'uptown')
      station1.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop.should be_an_instance_of Stop
    end
  end

  context '#id' do
    it 'is nil before the stop is saved'
    it 'has a value after the stop is saved'
  end

  context 'readers' do
    it 'returns the value of the stop name' do
      line1 = Line.new('line_name' => 'red')
      line1.save
      station1 = Station.new('station_name' => 'uptown')
      station1.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop.save
      stop.line_name.should eq 'red'
      stop.station_name.should eq 'uptown'

      # stop.station.should eq station1
    end
  end

  context '#save' do 
    it 'saves and adds a stop with a line and station to the db' do 
      line1 = Line.new('line_name' => 'red')
      line1.save
      station1 = Station.new('station_name' => 'uptown')
      station1.save
      stop = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop = Stop.new('line' => line1, 'station' => station)
      stop.save
      Stop.all.should eq [stop]
    end
  end

  context '.all' do 
    it 'returns an array of all the stops' do 
      line1 = Line.new('line_name' => 'red')
      line1.save
      line2 = Line.new('line_name' => 'green')
      line2.save
      station1 = Station.new('station_name' => 'uptown')
      station1.save
      station2 = Station.new('station_name' => 'downtown')
      station2.save
      stop1 = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
      stop1.save
      stop2 = Stop.new('line_id' => line2.line_id, 'station_id' => station2.station_id)
      stop2.save
      Stop.all.should eq [stop1, stop2]
    end 
  end

  # context '#==' do
  #   it 'considers two objects equal if their stop are equal' do
  #     line1 = Line.new('line_name' => 'red')
  #     line1.save
  #     line2 = Line.new('line_name' => 'green')
  #     line2.save
  #     station1 = Station.new('station_name' => 'uptown')
  #     station1.save
  #     station2 = Station.new('station_name' => 'downtown')
  #     station2.save
  #     stop1 = Stop.new('line_id' => line1.line_id, 'station_id' => station1.station_id)
  #     stop2 = Stop.new('line_id' => line2.line_id, 'station_id' => station2.station_id)
  #     stop1.save
  #     stop2.save
  #     stop1.should eq stop2
  #   end
  # end
end