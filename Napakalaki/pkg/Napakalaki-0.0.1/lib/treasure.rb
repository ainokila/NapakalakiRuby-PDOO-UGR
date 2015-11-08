# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Treasure
  
  attr_accesor :name, :bonus ,:type
  
  def initialize(nombre,bon,kind)
    @name=nombre
    @bonus=bon
    @type=kind
  end
 
end
