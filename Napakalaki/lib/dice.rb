# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'

class Dice
  include Singleton
  
  def initialize
    
  end
  
  def get_instance()
    Dice.instance
  end
  
  def next_number
    Random.rand(1...6)
  end
  
end
