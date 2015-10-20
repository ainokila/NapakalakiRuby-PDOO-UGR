# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Bad_consequence
  attr_accessor :text ,:levels,:nVisibleTreasures,:nHiddenTreasures,:death,:specificVisibleTreasures, :specificHiddenTreasures
  
  def self.constructor1(text,levels,nVisible,nHidden)
    objeto=Bad_consequence.new
    objeto.text=text
    objeto.levels=levels
    objeto.nVisibleTreasures=nVisible
    objeto.nHiddenTreasures=nHidden
    objeto.specificVisibleTreasures=Array.new
    objeto.specificHiddenTreasures=Array.new
    objeto.death=false
    objeto
  end
  
  def self.constructor2(text,levels,tVisible,tHidden)
    objeto=Bad_consequence.new
    objeto.text=text
    objeto.levels=levels
    objeto.specificVisibleTreasures=tVisible
    objeto.specificHiddenTreasures=tHidden
    objeto.death=false
    objeto
  end
  
  def self.constructor3(text,death)
      objeto=Bad_consequence.new
      objeto.text=text
      objeto.death=death
      objeto.specificVisibleTreasures=Array.new
      objeto.specificHiddenTreasures=Array.new
      objeto
  end
  
  def to_s
      " Mal rollo: #{@text} \n Pierdes: #{@levels} niveles."
  end
  
end
