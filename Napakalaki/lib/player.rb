
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

require_relative 'treasure'
require_relative 'bad_consequence.rb'
require_relative 'dice.rb'
require_relative 'combat_result.rb'


class Player
  attr_accessor :name, :level, :dead, :can_i_steal, :hidden_treasures, :visible_treasures, :pending_bad_consequence ,:enemy
  protected :enemy
  
  @@CONST_MAXLEVEL = 10
  
  
   def initialize(n,d,l,v_t,h_t,cis,pbc)
     
      @name = n
      @dead = d
      #Inicializamos el nivel a 1
      @level = l 
      @visible_treasures = v_t
      @hidden_treasures = h_t
      @can_i_steal = cis
      @pending_bad_consequence = pbc
        
      
   end
   
   #Constructor por copia
   
   def self.copia(p)
    
     self.new(p.name,p.dead,p.level,p.visible_treasures,p.hidden_treasures,p.can_i_steal,p.pending_bad_consequence)
     
   end
   
   def is_death
      @dead    
    end
 
   
   def should_convert
     
      dado = Dice.get_instance.next_number
      sol = false

     if dado == 1
         sol = true              
     end
      sol
   end
  
   protected :should_convert
 
     
   
   def  get_oponent_level(m)
      m.get_combatlevel
 
   end
  
     protected :get_oponent_level
     
  def bring_to_life
    
     @dead = false;
  
  end
  
  private :bring_to_life
  
  def get_level_treasures

    solucion  = 0
        
    visible_treasures.each do |vis|
      
      solucion = solucion + vis.bonus
      
    end
       
    solucion
    
  end
  
  private :get_level_treasures
 
 
   def get_combat_level
     
       
     combat_level=0;
        
     combat_level = get_level_treasures 
     
        combat_level = combat_level + @level;
     
    combat_level
   
   end
 
   protected :get_combat_level   
   
   
   def increment_levels(i)
     
     if( @level + i >= @@CONST_MAXLEVEL )
        @level = @@CONST_MAXLEVEL
     
     else
      
       @level = @level + i
       
     end
   end
   
   private :increment_levels
   
    def decrement_levels(i)
      
       if(@level-i <= 1)
          @level = 1
       
       else
        @level = @level - i
     
      end

    end
    
    private :decrement_levels
    
   
  def set_pending_bad_consequence(b)
     
     @pending_bad_consequence = b
     
  end
  
  private :set_pending_bad_consequence
  
 
  def die_if_no_treasures
         
     if @hidden_treasures.length	 == 0 and @visible_treasures.length == 0
       
         @dead = true
     end
     
  end
 
  private :die_if_no_treasures
  
  
  def valid_state
     
     solucion=true
     
     if ((!@pending_bad_consequence.is_empty) or @hidden_treasures.length > 4)
         
         solucion = false
     end
     
     solucion
  end   
 
  def how_many_visible_treasures(t_kind)
      
      solucion = 0
      
      
    @visible_treasures.each do |vis|
      
      if vis.type == t_kind then
        
        solucion = solucion + 1
      
      end
      
    end
      
            
    solucion
    
  end
  
  private :how_many_visible_treasures
  
  def set_enemy_player(enemy)
      
      @enemy = enemy
  end

   
  def have_stolen 
       
      @can_i_steal = false
      
  end

  private :have_stolen
  
  def can_you_give_me_a_treasure
    
    solucion = false
      
      if @hidden_treasures.length > 0  then 
         
          solucion = true
          
      end

    solucion 
  
  end
  
  #private :can_you_give_me_a_treasure
 
    def can_make_treasure_visible(t)
   
       result = false

      case t.get_type()

      when TreasureKind::ONEHAND 

        if is_treasure_kind_in_use(TreasureKind::BOTHHANDS) then
          result = false
        else
          
          i = 0
          @visible_treasures.each do |tv|
            if tv.get_type() == TreasureKind::ONEHAND then
              i += 1
            end
                        
          end

          if i == 2 then
            result = false
          else
            result = true
          end
        end

      else 
        result = !is_treasure_kind_in_use(t.get_type())

      end

      result
    end
    
    private :can_make_treasure_visible
    
    def is_treasure_kind_in_use(type) 

      result = false
      @visible_treasures.each do |tesoro|
        if type == tesoro.get_type() then

          result = true
          break

        end

      end
      result
    end
    private :is_treasure_kind_in_use
 
    
  def apply_prize(m)
 
    increment_levels(m.get_levels_gained)
    tesoros = m.get_treasures_gained
    
    baraja = CardDealer.get_instance
        
        for i in 0..tesoros-1
          @hidden_treasures << baraja.next_treasure
          
        end
   end
   
  private :apply_prize
  
    def apply_bad_consequence(m)
      
      bad = m.get_bad_consequence
          
      if bad.is_dead == false
                puts bad.class.to_s 
                pending_bad = bad.adjust_to_fit_treasure_list(@visible_treasures,@hidden_treasures)

                niveles = pending_bad.getLevels

                decrement_levels(niveles)
                
            #Como ya se han perdido los niveles, ahora los vuelvo a poner a 0
                pending_bad.setLevels(0)
                
                @pending_bad_consequence = pending_bad
                
      else if  bad.is_dead == true
          
            
          #Al morir el jugador, este pierde todos los tesoros de los que dispone (tanto equipados como ocultos)
          #y su nivel quedará fijado en 1.
         
          #Decremento el máximo de niveles para asegurar que el nivel del player se pone a 1.
          decrement_levels(@@CONST_MAXLEVEL)
          
          #Y por último descarto todos los tesoros
          discardAllTreasures
          
           puts 'Al morir el jugador, este pierde todos los tesoros de los que dispone
                                (tanto equipados como ocultos) y su nivel queda fijado en 1.'
       end
      
      end
      
    end

  private :apply_bad_consequence
  
  def stealTreasure
    can_i = canISteal
    
    if(can_i)
      can_you = @enemy.can_you_give_me_a_treasure
      
      if(can_you)
        treasure = enemy.give_me_a_treasure
        @hidden_treasures << treasure
        @enemy.hidden_treasures.delete(treasure)
        @enemy.die_if_no_treasures
       #duda#
       have_stolen
        
      end
    end
    treasure
  end
  
  def  give_me_a_treasure
    
    maximo = @hidden_treasures.length - 1
    
    pos_aleatorio = Random.rand(0..maximo)
    
    solucion = @hidden_treasures.at(pos_aleatorio)
    @hidden_treasures.delete(solucion)#queda por probar
    
   solucion   
  end
  
  def discardVisibleTreasure(t)
      
      @visible_treasures.delete(t)
      
      if @pending_bad_consequence != nil  and !@pending_bad_consequence.is_empty
           
          @pending_bad_consequence.substract_visible_treasure(t)
          
      if @pending_bad_consequence.getnVisibleTreasures > 0 then
              n = @pending_bad_consequence.getnVisibleTreasures
               n=n-1
              @pending_bad_consequence.setnVisibleTreasures(n)
          end
      end
      die_if_no_treasures 
      CardDealer.get_instance.give_treasure_back(t)
      
    
  end
      
  
  
  def discardHiddenTreasure(t)
      
     @hidden_treasures.delete(t)
      
      if @pending_bad_consequence != nil  and !@pending_bad_consequence.is_empty
           
          @pending_bad_consequence.substract_hidden_treasure(t)
          
      if @pending_bad_consequence.getnHiddenTreasures > 0 then
              n = @pending_bad_consequence.getnHiddenTreasures
               n=n-1
              @pending_bad_consequence.setnHiddenTreasures(n)
          end
      end
      die_if_no_treasures 
      CardDealer.get_instance.give_treasure_back(t)
      
    
  end
      
  
  def discardAllTreasures
    
    visible = @visible_treasures.clone
    oculto = @hidden_treasures.clone
    for i in visible 
      discardVisibleTreasure(i)
    end
    for j in oculto
      discardHiddenTreasure(j)
    end
    
    
    
    die_if_no_treasures 
  end
  
      
  def init_treasures
    
      dealer = CardDealer.instance
      d = Dice.instance
      bring_to_life
      
      treasure = dealer.next_treasure
      @hidden_treasures << treasure
      
      number = d.next_number
      
      if number > 1
          treasure = dealer.next_treasure
          @hidden_treasures << treasure
      end
      
      if number == 6
          treasure = dealer.next_treasure();
          @hidden_treasures << treasure
          
      end
      
   
 
  end
  
  def combat(m)
      
      
      my_level = get_combat_level
      monster_level = m.get_combatlevel
     
        
      if my_level > monster_level 
              
        apply_prize(m)
          
          if @level >= @@CONST_MAXLEVEL
            combate = NapakalakiGame::CombatResult::WINGAME
          
          else
            combate = NapakalakiGame::CombatResult::WIN
          end
         
      else
          apply_bad_consequence(m)  
          die_if_no_treasures
          if should_convert
            combate = NapakalakiGame::CombatResult::LOSEANDCONVERT
            
          else
            combate = NapakalakiGame::CombatResult::LOSE
          end

      end
      
      combate
  end
  
  def canISteal
    @can_i_steal
  end
 
  def makeTreasureVisible(t)
      
      can_i = can_make_treasure_visible(t)
      
      if can_i
          @visible_treasures << t
          @hidden_treasures.delete(t);
      end
  end
  
  def getVisibleTreasures
    @visible_treasures
  end
  
  def getHiddenTreasures
   @hidden_treasures
  end
  
  def to_s
    "#{@name} 
      \n Nivel: #{@level} 
       Mal Rollo Pendiente : #{@pending_bad_consequence}
      " 
  end

end
