# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_accessor :treasures, :level;
  
  def initialize(treasures,level)
    @treasures=treasures
    @level=level
  end
  
  def toString
    solucion="Treasures = "+@treasure.to_s+" levels= "+@level.to_s
  end
  
end
