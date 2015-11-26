# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer.rb"
require_relative "player.rb"
require 'singleton'

class Napakalaki
  include Singleton
  
  attr_accessor :current_player, :players, :dealer, :current_monster
  #private :init_players , :next_player, :next_turn_allowed , :set_enemies
    
  def initialize
    @dealer = CardDealer.get_instance
  end
  
  def self.get_instance
    Napakalaki.instance
  end


  def init_players(names)
    
     @players = Array.new
     names.each do |iterador|
       jugador = Player.new(iterador)
       @players << jugador
      end
  end
  private :init_players
 
        
  def next_player
    
     aux = 0
     posicion = 0
     contador=0
     
      if @currentPlayer.nil?
          numeroJugadores = @players.length - 1
          posicion =  Random.rand(1..numeroJugadores)
          aux = @players.index(posicion)
      
                   
    
      else
       
        @players.each do |iterador|
          contador++
          if(@currentPlayer == iterador)
              posicion = contador          
          end
        end
        posicion = posicion +1
        
        if posicion >= @players.length
                aux = @players.index(0);
        else
                aux = @players.index(posicion);
        
                
       end
      end
    aux
  end
  private :next_player

  def next_turn_allowed
       
    solucion = false
          
    if @current_player.nil?
              solucion = false
    else
        solucion = @current_player.valid_state
    end
    solucion
  end
  private :next_turn_allowed

  def set_enemies
    
    pos_aleatorio = 0
    tamanio = @players.length
      
     @players.each do |iterador|

       pos_aleatorio =  Random.rand(1..tamanio)

       while (@players.at(pos_aleatorio) == iterador)
           pos_aleatorio =  Random.rand(1..tamanio)
           puts pos_aleatorio
       end
       iterador.set_enemy_player(@players.at(pos_aleatorio))
     end
     
  end
  private :set_enemies
  
  def develop_combat
      m = @current_onster;
      combat_result = @current_player.combat(m);
    
    @dealer.give_monster_back(m);
      
    return combat_result;  
    
  end

  def discard_visible_treasures(treasures)
    
      treasures.each do |treasure|
          @current_player.discard_visible_treasure(treasure)
          @dealer.give_treasure_back(treasure)
      
    
  
    end
  end
  
  
  def discard_hidden_treasures(treasures)
      
      treasures.each do |treasure|
          
          @current_player.discard_hidden_treasure(treasure)
          @dealer.give_treasure_back(treasure)
      
    
  
    end
  end
  
  def make_treasures_visible(treasures)
     
    treasures.each do |t|
          @currentPlayer.make_treasure_visible(t)
    end
    
  end
      
  def initGame(player)
    
    init_players(player);
    set_enemies
    @dealer.init_cards
    next_turn 
    
  end

  def next_turn
     
    state_ok = false
    state_ok = next_turn_allowed 
   
   if state_ok == true
       
       @current_monster = dealer.next_monster
       @current_player = next_player
       
       dead = @current_player.is_death
       
       if dead == true
           @currentPlayer.init_treasures
       end
       
   end
     state_ok;
  end

  def end_of_game(result)
    
    resultado=false
    
    if result.to_s == "WINGAME"
            resultado = true
    end
    
    resultado    
  end
  def getCurrentPlayer
    @current_player
  end
  
  def getCurrentMonster
    @current_monster
  end

end
