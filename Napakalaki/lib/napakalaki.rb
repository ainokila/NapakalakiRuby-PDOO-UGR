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
  
  def self.get_instance
    Napakalaki.instance
  end


  def init_players(names)
    
     @players = Array.new
     names.each do |iterador|
     @players << iterador
      end
  end
 
        
  def next_player
    
     aux = 0
     posicion = 0
     contador=0
     
      if @currentPlayer.nil?
          numeroJugadores = @players.length - 1
          posicion =  Random.rand(1...numeroJugadores)
          aux = @players.at(posicion)
      
                   
    
      else
       
        @players.each do |iterador|
          contador++
          if(@currentPlayer == iterador)
              posicion = contador          
          end
        end
        posicion = posicion +1
        
        if posicion >= @players.length
                aux = @players.at(0);
        else
                aux = @players.at(posicion);
        
                
       end
      end
    aux
  end

  def next_turn_allowed
       
    solucion = false
          
    if @current_player.nil?
              solucion = false
    else
        solucion = @current_player.valid_state
    end
    solucion
  end

  def set_enemies
    
    pos_aleatorio = 0
    tamanio = @players.length
    
     @players.each do |iterador|
        
       pos_aleatorio =  Random.rand(1...tamanio)
       
       while (@players.at(pos_aleatorio) == iterador)
           
           pos_aleatorio =  Random.rand(1...tamanio)
       end
        
       iterador.set_enemy_player(@players.at(pos_aleatorio));
     end
  end
  
  def develop_combat
      m = @current_onster;
      combat_result = @current_player.combat(m);
    
    @dealer.give_monster_back(m);
    
    return combat_result;  
    
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
