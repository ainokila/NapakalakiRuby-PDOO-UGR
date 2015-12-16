# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class DeathBadConsequence < NumericBadConsequence
  
  attr_accessor :death

        
  def initialize(text)
    super(text,0,0,0)
    @death = true
  end
  
end
