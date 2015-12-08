# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  
  attr_accessor :total_cultist_players , :my_cultist_card 
  
  
     def initialize(p, c)
       #no se si es asi
       super.copia(p)
       @my_cultist_card = c
    
     end
   
    
    def get_combat_level
                      
        sol = super.get_combat_level
        sol = sol * 120
        sol = sol / 100
        sol = sol + @my_cultist_card.get_gained_levels * @total_cultist_players
        
      sol
               
    end 
    
    def get_oponent_level(m)
       m.get_combat_level_against_cultist_player
    
    end
    
    def should_convert
      
      sol =false
       
      sol
    end
    
    
     def giveMeATreasure
   
       posAleatorio = Random.rand(1...super.visible_treasures.length)
       solucion = super.visible_treasures.at(posAleatorio)
    
       solucion
     end
    
    def canYouGiveMeATreasure
     
      solucion = false
      
      if super.visible_treasures.length > 0 
         
          solucion = true   
       
      solucion
      end
    end
    
    def  getTotalCultistPlayers
      
        @total_cultist_players
        
    end
    

end
