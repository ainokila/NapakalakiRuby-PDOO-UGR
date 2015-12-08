# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#encoding: utf-8
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

class Monster
  attr_accessor :name, :combat_level , :bad_consequence , :price , :level_change_against_cultist_player
  
   def initialize(name, combat_level, bad_consequence, price)
    
    @name = name
    @combat_level= combat_level
    @bad_consequence = bad_consequence
    @price = price
    
    
   end
  
  
  def get_bad_consequence
    @bad_consequence
  end
  def get_combatlevel
    @combat_level
  end
  
  def get_levels_gained
    @price.level
  end
   
  def get_treasures_gained
    @price.treasures
  end
  
  def get_combat_level_against_cultist_player
       
        valor = get_combatlevel + @level_change_against_cultist_player
        valor
  end
  
  def to_s()
    "******************************\n Nombre del Monstruo: #{@name}\n Nivel de combate: #{@combat_level.to_s}\n #{@bad_consequence.to_s}\n #{@price.to_s}" 
  end
  
 
 end