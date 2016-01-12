# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
