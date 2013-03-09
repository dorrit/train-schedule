class Stop
  attr_reader :line_name, :station_name, :line_id, :station_id, :stop_id

  def initialize(attributes_hash)
    @line_id = attributes_hash['line_id'].to_i
    @station_id = attributes_hash['station_id'].to_i
    @stop_id = attributes_hash['id'].to_i
    
    unless attributes_hash['line_name'] == nil
      @line_name = attributes_hash['line_name']
    else
      @line_name = DB.exec("SELECT line_name FROM lines WHERE id = #{@line_id};").inject([]) { |lines, line_hash| lines << Line.new(line_hash)}.first.line_name
    end
    unless attributes_hash['station_name'] == nil
      @station_name = attributes_hash['station_name']
    else
      @station_name = DB.exec("SELECT station_name FROM stations WHERE id = #{@station_id};").inject([]) { |stations, station_hash| stations << Station.new(station_hash)}.first.station_name
    end
    # @line_name = DB.exec("SELECT line_name FROM lines WHERE id = #{@line_id};").inject([]) { |lines, line_hash| lines << Line.new(line_hash)}.first.line_name
    # @station_name = DB.exec("SELECT station_name FROM stations WHERE id = #{@station_id};").inject([]) { |stations, station_hash| stations << Station.new(station_hash)}.first.station_name
    
  end

  def save
    @stop_id = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station_id}, #{@line_id}) RETURNING id;").map {|result| result['id']}.first.to_i
    # @line_id = DB.exec("INSERT INTO lines (line_name) VALUES ('#{@line}') RETURNING id;").map {|result| result['id']}[0]
    # @id = DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;").map {|result| result['id']}[0]
  end

  def self.all
    results = DB.exec("SELECT *
             FROM lines, stations, stops
             WHERE stops.line_id = lines.id 
             AND stops.station_id = stations.id;")
    # results.each {|result| p result}
    results.inject([]) {|stops, stop_hash| stops << Stop.new(stop_hash)}
  end

def ==(other)
    if other.class != self.class
      false
    else
      self.station_id == other.station_id && self.line_id == other.line_id && self.stop_id == other.stop_id
  end
end  

# private
#     def self.from_pg_result(pg_result)
#       pg_result.inject([]) { |stops, stop_hash| stops << Stop.new(stop_hash["line_id"], stop_hash["station_id"])}
#     end

end