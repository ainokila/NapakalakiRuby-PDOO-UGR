
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

class Bad_consequence
  attr_accessor :text ,:levels
  
   
  
  def initialize (t, l)
    @text = t
    @levels = l    
  end
  
    
  def to_s()
    "#{@text}, Pierdes: #{@levels} niveles. "
  end
  
  def setLevels(l)
    
    @levels = l
    
  end
  
  def is_empty
     
    @solucion 
         if @text == "" and @levels == 0 
                    
              solucion = true
         end
               
    solucion;

  end
  
  def getLevels
    @levels
  end
  
  def getText
    @text
  end
  
  def substract_visible_treasure(t)
    raise NotImplementedError.new 
  end
  
  def substract_hidden_treasure(t)
    raise NotImplementedError.new
  end
  
  def is_dead
    raise NotImplementedError.new
  end
  
  def setnVisibleTreasures(n)
      raise NotImplementedError.new
  end
    
  def setnHiddenTreasures(n)
      raise NotImplementedError.new
  end
  
  def getnVisibleTreasures
      raise NotImplementedError.new
  end
  
  def getnHiddenTreasures
      raise NotImplementedError.new
  end
  
  
  
  
  def adjust_to_fit_treasure_list(v, h)
      raise NotImplementedError.new    
     
  end
  
end

       
 
