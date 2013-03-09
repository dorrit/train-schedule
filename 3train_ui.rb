require 'pg'
require './lib/stop'
require './lib/station'
require './lib/line'

DB = PG.connect(:dbname => 'train3', :host => 'localhost')


def welcome
  puts "WELCOME TO YOUR TRAIN SYSTEM!"
  menu
end

def operator_menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a stop."
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add_stop
    when 'e'
      exit
    else
      invalid
    end
  end
end

def add_stop
  puts "Please enter the line name:"
  line_name = gets.chomp
  puts "Please enter the station name:"
  station_name = gets.chomp
  stop = Stop.new(line_name, station_name)
  stop.save


end

welcome


