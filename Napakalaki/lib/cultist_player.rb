# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  
  attr_accessor :total_cultist_players , :my_cultist_card 
  
  
     def initialize(p, c)
       #no se si es asi
       copia(p)
       @my_cultist_card = c
    
     end
   
    
    def get_combat_level
                      
        sol = get_combat_level
        sol = sol * 120
        sol = sol / 100
        sol = sol + @my_cultist_card.get_gained_levels * @total_cultist_players
        
      sol
               
    end 
    
    protected :get_combat_level
    
    def get_oponent_level(m)
       m.get_combat_level_against_cultist_player
    
    end
   
    protected :get_oponent_level
    
    def should_convert
      
      sol =false
       
      sol
    end
    
    protected :should_convert
    
     def giveMeATreasure
   
       pos_aleatorio = Random.rand(0..(@visible_treasures.length-1))
       solucion = @visible_treasures.at(pos_aleatorio)
    
       solucion
     end
     
     private :giveMeATreasure
    
    def canYouGiveMeATreasure
     
      solucion = false
      
      if super.visible_treasures.length > 0 
         
          solucion = true   
       
      solucion
      end
    end
    
    private :canYouGiveMeATreasure
    
    def  getTotalCultistPlayers
      
        @total_cultist_players
        
    end
    

end
