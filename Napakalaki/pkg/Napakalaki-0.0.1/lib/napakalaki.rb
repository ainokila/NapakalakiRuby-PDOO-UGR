# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer"
require_relative "player"
require 'singleton'

class Napakalaki
  include Singleton
  
  attr_accessor :current_player, :players, :dealer, :current_monster
  private_class_method :init_players , :next_player, :next_turn_allowed , :set_enemies ,
    
  def initialize
    
  end
  
  def get_instance()
    Napakalaki.instance
  end


  def init_players(nombres)
    
  end
        
  def next_player
    
  end

  def next_turn_allowed
    
  end

  def set_enemies
    
  end
  
  def developCombat
    
  end

  def discard_visible_treasures(treasures)
    
  end
  
  def discard_hidden_treasures(treasures)
    
  end

  def make_treasures_visible(treasures)
    
  end

  def init_game(player)
    
  end

  def get_current_player
    
  end

  def get_current_monster
    
  end

  def next_turn
    
  end

  def end_of_game(result)
    
  end

end
