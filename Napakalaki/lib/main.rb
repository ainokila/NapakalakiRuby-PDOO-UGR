# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

puts "Hello World"

a=Prize.new(5,5)
puts a.toString
a = Bad_consequence.new("Hola",5,2,3)
puts a.to_s
puts a.to_s