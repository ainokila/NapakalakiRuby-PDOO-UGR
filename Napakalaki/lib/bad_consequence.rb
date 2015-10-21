# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


#encoding: utf-8

class Bad_consequence
  attr_accessor :text ,:levels,:nVisibleTreasures,:nHiddenTreasures,:death,:specificVisibleTreasures, :specificHiddenTreasures
  
  private_class_method :new
  
  
  def initialize (t, l, n_v, n_h, s_v, s_h, d)
    @text = t
    @levels = l
    @nVisibleTreasures = n_v
    @nHiddenTreasures = n_h
    @death = d
    @specificVisibleTreasures = s_v
    @specificHiddenTreasures = s_h
    
  end
  
  def self.new_level_number_of_treasures(text,levels,nVisible,nHidden)
    
    new(text, levels ,nVisible, nHidden, Array.new, Array.new,false)
    
  end
  
  def self.new_level_specific_treasures(text,levels,tVisible,tHidden)
    
   new(text, levels ,0, 0, tVisible, tHidden, false)
    
  end
  
  def self.new_death(text)
    new(text, 0, 0, 0, Array.new, Array.new, true)
    
  end
  
  def to_s
    "Mal rollo: #{@text} 
    \n Pierdes: #{@levels} niveles 
    \n y pierdes #{@nVisibleTreasures} tesoros visibles 
    \n y #{@nHiddenTreasures} tesoros ocultos
    \n muerte: #{@death} 
    \n Tipo de Tesoro Visible: #{@specificVisibleTreasures} 
    \n Tipo de Tesoro Oculto: #{@specificHiddenTreasures}."
  end
  
end
