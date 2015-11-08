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
    @unused_treasures = @unusuded_treasures.shuffle
  end
  
  def shuffle_monster
    @unused_monster = @unusuded_monster.shuffle
  end
  
  def next_treasure
    
      if @unused_treasures.empty?
            
        @used_treasures.each do |treasure| 
          
          @unused_treasures<<treasure
        
        end
        
        shuffle_treasures
        @used_treasures.clear
        
      end
        
      treasure = @unused_treasures.at(0)

      @used_treasures<<treasure
      
      @unused_treasures.delete(treasure);
      treasure
    
  end
  
  def next_monster
    if @unused_monster.empty?
            
        @used_monster.each do |monster| 
          
          @unused_monster<<monster
        
        end
        
        shuffle_monster
        @used_monster.clear
        
      end
        
      monster = @unused_monster.at(0)

      @used_monster<<monster
      
      @unused_monster.delete(monster);
      monster
    
  end
  
  def give_treasure_back(treasure)
    @used_treasure << treasure
  end
  
  def give_monster_back(monster)
    @used_monster << monster
  end
  
  def init_cards
    init_treasure_card_deck
    init_monster_card_deck
    shuffle_treasures
    shuffle_monster 
  end

end
