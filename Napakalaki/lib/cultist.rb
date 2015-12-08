# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Cultist
    
  attr_accessor :name, :gained_levels
  
  def initialize(n, g_l)
    
      @name = n
      @gained_levels = g_l     
        
    
  end
    
    def getGainedLevels
      
        @gained_levels
        
    end
end
