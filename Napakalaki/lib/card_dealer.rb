# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class CardDealer
  
  include Singleton
  attr_accesor :unused_treasures ,:used_treasures, :unused_monster ,:used_monster
  private_class_method :init_treasure_card_deck , :init_monster_card_deck
  
  def initialize
    @unused_treasures = Array.new
    @used_treasures = Array.new
    @unused_monster = Array.new
    @used_monster = Array.new
  end
  
  def self.get_instance
    self.instance
  end
  
  def init_treasure_card_deck
    #Crear los treasures
  end
  
  def init_mosnter_card_deck
    #Crear los treasures
  end
  
  def shuffle_treasures
    unusuded_treasures.shuffle
  end
  
  def shuffle_monster
    unusuded_monster.shuffle
  end
  
  def next_treasure
    
  end
  
  def next_monster
    
  end
  
  def give_treasure_back
    
  end
  
  def give_monster_back
    
  end
  
  def init_cards
    
  end

end
