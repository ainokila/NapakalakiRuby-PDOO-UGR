
#Copyright 2016 Cristian Velez Ruiz universidadcvr@gmail.com
#Copyright 2016 Jorge Gutierrez Segovia

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>. 
#encoding: utf-8
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

class Monster
  attr_accessor :name, :combat_level , :bad_consequence , :price , :level_change_against_cultist_player
  
   def initialize(name, combat_level, bad_consequence, price, ic)
    
    @name = name
    @combat_level= combat_level
    @bad_consequence = bad_consequence
    @price = price
    @level_change_against_cultist_player = ic
    
   end
 
   
   def self.copia(name, combat_level, bad_consequence, price,ic)
       
      self.new(name, combat_level, bad_consequence, price, ic)
      
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
  
  def to_s
    "******************************\n Nombre del Monstruo: #{@name}\n Nivel de combate: #{@combat_level.to_s}\n #{@bad_consequence.to_s}\n #{@price.to_s}" 
  end
  
 
 end