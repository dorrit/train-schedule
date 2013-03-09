class Line

attr_reader :line_name, :line_id

  def initialize(attributes_hash)
    @line_name = attributes_hash['line_name']
    @line_id = attributes_hash['id'].to_i
  end

  def save
    @line_id = DB.exec("INSERT INTO lines (line_name)
                        VALUES ('#{@line_name}')
                        RETURNING id;").map {|result| result['id']}.first.to_i
  end


  def self.all 
    Line.from_pg_result(DB.exec("SELECT * FROM lines;"))
  end

  def ==(other)
    if other.class != self.class
      false
    else
      self.line_name == other.line_name 
  end
end


  private
    def self.from_pg_result(pg_result)
      pg_result.inject([]) { |lines, line_hash| lines << Line.new(line_hash)}
    end

end
