
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
class DeathBadConsequence < NumericBadConsequence
  
  attr_accessor :death

        
  def initialize(text)
    super(text,0,0,0)
    @death = true
  end
  
  def adjust_to_fit_treasure_list(v, h)
      bad_cons = DeathBadConsequence.new('')  
      bad_cons 
  end
  
end
