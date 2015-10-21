# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Bad_consequence
  attr_accessor :text ,:levels,:nVisibleTreasures,:nHiddenTreasures,:death,:specificVisibleTreasures, :specificHiddenTreasures
  
  
  def initialize (t, l, n_v, n_h, d, s_v, s_h)
    @text = t
    @levels = l
    @nVisibleTreasures = n_v
    @nHiddenTreasures = n_h
    @death = d
    @specificVisibleTreasures = s_v
    @specificHiddenTreasures = s_h
    
  end
  
  def self.new_sin_arrays(text,levels,nVisible,nHidden)
    
    new(text, levels ,nVisible, nHidden, false, Array.new, Array.new)
    
  end
  
  def self.new_con_arrays(text,levels,tVisible,tHidden)
    
   new(text, levels ,0, 0, false, tVisible, tHidden)
    
  end
  
  def self.new_muerte(text,death)
    new(text, 0, 0, 0, death, Array.new, Array.new)
    
  end
  
  def to_s
    " Mal rollo: #{@text} \n Pierdes: #{@levels} niveles."
  end
  
end
