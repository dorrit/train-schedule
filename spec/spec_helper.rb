require 'pg'
require 'rspec'
require 'stop'
require 'line'
require 'station'


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stops *;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
  end
end


DB = PG.connect(:dbname => 'test_train3', :host => 'localhost')

