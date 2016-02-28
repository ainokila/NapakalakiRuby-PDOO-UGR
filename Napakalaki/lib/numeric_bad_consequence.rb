
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

class NumericBadConsequence < Bad_consequence
  
  
    attr_accessor :nVisibleTreasures , :nHiddenTreasures 

  def initialize(text, levels , nVisible, nHidden)
     super(text, levels)
     @nVisibleTreasures = nVisible
     @nHiddenTreasures = nHidden
    
  end
    

    def is_dead
      solucion = false
      
      solucion
    end
    
    def substract_visible_treasure(t)
      #raise NotImplementedError.new
      @nVisibleTreasures = @nVisibleTreasures-1
    end
    
   def substract_hidden_treasure(t)
       #raise NotImplementedError.new
       @nHiddenTreasures = @nHiddenTreasures -1
   end
    
    def setnVisibleTreasures(n)
        
        @nVisibleTreasures = n
    end

    def setnHiddenTreasures(n)
      
        @nHiddenTreasures = n
    end
    
    def getnVisibleTreasures
       @nVisibleTreasures
    end
    
    def getnHiddenTreasures
        @nHiddenTreasures
    end
        
    def is_empty
       solucion = false
         if @text == "" and @levels == 0 and @nVisibleTreasures == 0 and @nHiddenTreasures == 0 
                    solucion = true
         end
        
       solucion
 
    end
    
    def adjust_to_fit_treasure_list(v, h)
            
         visibles=0
         ocultos=0
         tam_v = v.length
         tam_h = h.length
  
         if @nVisibleTreasures <= tam_v
               visibles = @nVisibleTreasures

         else 
           
            if tam_v < @nVisibleTreasures
                          visibles = tam_v
           end
         end
                    
         if @nHiddenTreasures <= tam_h 
                        ocultos = @nHiddenTreasures

         else 
           
            if tam_h < @nHiddenTreasures
                       ocultos = tam_h
            end
         end
  
          solucion = NumericBadConsequence.new("",getLevels,visibles,ocultos)
        
    solucion
   end
    
    def to_s

      "#{@text}, Pierdes: #{@levels} niveles.  , #{@nVisibleTreasures} tesoros visibles y #{@nHiddenTreasures} tesoros ocultos."
    end
    
end
