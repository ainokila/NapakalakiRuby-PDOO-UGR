
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

class SpecificBadConsequence < Bad_consequence
  
  attr_accessor :specificVisibleTreasures , :specificHiddenTreasures

     
  def initialize(text,levels,tVisible,tHidden)
        super(text, levels)
        @specificHiddenTreasures = tHidden
        @specificVisibleTreasures = tVisible    
  end
    
  def getVisibleTreasures
       @specificVisibleTreasures
  end 
    
  def getHiddenTreasures
       @specificHiddenTreasures
  end 
    
  def to_s
    "#{@text}, Pierdes: #{@levels} niveles.  , #{@specificVisibleTreasures} tesoros visibles y #{@specificHiddenTreasures} tesoros ocultos."
  end
                    
  def is_dead    
       solucion = false
       solucion
  end
    
  def is_empty
       solucion = false
       if @text == "" and @levels == 0 and @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
            solucion = true
         end
        
       solucion
 
  end
    
  def setnVisibleTreasures(n)
      raise NotImplementedError.new
  end
    
  def setnHiddenTreasures(n)
      raise NotImplementedError.new
  end
  
  def getnVisibleTreasures
      return 0
  end
    
  def getnHiddenTreasures
      return 0
  end
    
  def substract_visible_treasure(t)
      @specificVisibleTreasure.delete(t.type)
  end
     
  def substract_hidden_treasure(t)
      @specificHiddenTreasure.delete(t.type)
  end
     
def adjust_to_fit_treasure_list(v, h)
     visible = Array.new
     hidden = Array.new
        
        v.each do |t|
            
            if @specificVisibleTreasures.include?(t.type) == true
                visible << t.type
            end
        end
        
        
        h.each do |t|
            
            if @specificHiddenTreasures.include?(t.type) == true
                hidden << t.type
            end
        end  
        
        bad_cons = SpecificBadConsequence.new('', @levels, visible, hidden)  
        bad_cons
  end
     

end
