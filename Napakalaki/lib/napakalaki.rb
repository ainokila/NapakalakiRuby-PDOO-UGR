
#Copyright 2016 Cristian Velez Ruiz universidadcvr@gmail.com
#Copyright 2016 Jorge Gutierrez Segovia

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>. 

require_relative "card_dealer.rb"
require_relative "player.rb"
require_relative "numeric_bad_consequence.rb"
require_relative "death_bad_consequence.rb"
require_relative "specific_bad_consequence.rb"
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
       jugador = Player.new(iterador, true, 1, Array.new, Array.new, true, NumericBadConsequence.new('',0,0,0))
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
          posicion =  Random.rand(0..numeroJugadores)
          aux = @players.at(posicion)
          @currentPlayer=aux
                   
    
      else
        
        @players.each do |iterador|
          contador = contador + 1
          if(@currentPlayer == iterador)
              posicion = contador          
          end
        end
     
        if posicion >= @players.length
                @currentPlayer = @players.at(0)
        else
                @currentPlayer = @players.at(posicion)
       
                
       end
      end
    @currentPlayer
  end
  private :next_player

  def next_turn_allowed
       
    solucion = false
          
    if @current_player.nil?
              solucion = true
    else
        solucion = @current_player.valid_state
    end
    
    solucion
  end
  private :next_turn_allowed

  def set_enemies
    
    pos_aleatorio = 0
    tamanio = @players.length - 1
      
     @players.each do |iterador|

       pos_aleatorio =  Random.rand(0..tamanio)

       while (@players.at(pos_aleatorio) == iterador)
           pos_aleatorio =  Random.rand(0..tamanio)
       end
       iterador.set_enemy_player(@players.at(pos_aleatorio))
     end
     
  end
  private :set_enemies
  
  def developCombat
    
      # @current _ monster esta vacio 
      m = @current_monster
      combat_result = @current_player.combat(m)
    
      @dealer.give_monster_back(m)
      
    combat_result    
  end

  def discardVisibleTreasure(treasures)
    
      treasures.each do |treasure|
          @current_player.discardVisibleTreasure(treasure)
          @dealer.give_treasure_back(treasure)
      
    
  
    end
  end
  
  
  def discardHiddenTreasure(treasures)
      
      treasures.each do |treasure|
          
          @current_player.discardHiddenTreasure(treasure)
          @dealer.give_treasure_back(treasure)
      
    
  
    end
  end
  
  def makeTreasureVisible(treasures)
     
    treasures.each do |t|
          @currentPlayer.makeTreasureVisible(t)
    end
    
  end
      
  def initGame(player)
    
    init_players(player);
    set_enemies
    @dealer.init_cards
    nextTurn 
    
  end

  def nextTurn
     
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
     state_ok
  end

  def end_of_game(result)
    
    resultado=false
    #
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
