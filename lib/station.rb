class Station
  attr_reader :station_name, :station_id


  def initialize(attributes_hash)
    @station_name = attributes_hash['station_name']
    @station_id = attributes_hash['id'].to_i
  end

  def save
    @station_id = DB.exec("INSERT INTO stations (station_name) VALUES ('#{@station_name}') RETURNING id;").map {|result| result['id']}.first.to_i
  end


  def self.all 
    Station.from_pg_result(DB.exec("SELECT * FROM stations;"))
  end

  def ==(other)
    if other.class != self.class
      false
    else
      self.station_name == other.station_name 
  end
end


  private
    def self.from_pg_result(pg_result)
      pg_result.inject([]) { |stations, station_hash| stations << Station.new(station_hash)}
    end


end