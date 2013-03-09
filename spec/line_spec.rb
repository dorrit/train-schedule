require 'spec_helper'

describe Line do 

  context '#initialize' do
    it 'initializes an instance of line' do 
      line = Line.new('line_name' => 'red').should be_an_instance_of Line
    end
  end

  context 'readers' do
    it 'returns the value for line_name' do
      line = Line.new('line_name' => 'pink')
      line.line_name.should eq 'pink'
    end
  end

  context '#save' do 
    it 'adds a line to the db' do 
      line = Line.new('line_name' => 'red')
      line.save
      Line.all.should eq [line]
    end
  end

  context '.all' do 
    it 'displays all the lines' do 
      line = Line.new('line_name' => 'brown')
      line2 = Line.new('line_name' => 'orange')
      line.save
      line2.save
      Line.all.map {|input| input}.should =~ [line, line2]
    end 
  end

  context '#==' do
    it 'considers two objects equal if their line_names are equal' do
      line1 = Line.new('Orange')
      line2 = Line.new('Orange')
      line1.should eq line2
    end
  end
end