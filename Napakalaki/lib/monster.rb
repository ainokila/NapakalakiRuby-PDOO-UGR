# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  attr_accessor :name, :combat_level , :bad_consequence , :price 
  
   def initialize(name, combat_level, bad_consequence, price)
    
    @name = name
    @combat_level= combat_level
    @bad_consequence = bad_consequence
    @price = price
    
  end
  
 
  end
