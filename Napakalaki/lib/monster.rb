# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  attr_accessor :name, :combat_level , :bad_consequence , :price 
  def self.constructor1 (name, combat_level, bad_consequence, price)
    monstruo = Monster.new
    monstruo.name = name
    monstruo.combat_level = combat_level
    monstruo.bad_consequence = bad_consequence
    monstruo.price = price
    monstruo
    
  end
  
  end
