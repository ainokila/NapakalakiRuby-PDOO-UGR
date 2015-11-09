# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure'
require_relative 'bad_consequence'

class Player
  attr_accessor :name, :level, :dead, :can_i_steal, :hidden_treasures, :visible_treasures, :enemy, :pending_bad_consequence
  
  CONST_MAXLEVEL = 10
  
  
   def initialize(name)
      
      @name = name
      @dead = true
      #Inicializamos el nivel a 1
      @level = 1 
      @visible_treasures = Array.new
      @hidden_treasures = Array.new
      @can_i_steal = true
      
   end
   
    def is_death
      @dead    
    end
 
 
  
  def bring_to_life
    
     @dead = false;
  
  end
  
  private :bring_to_life
  
  def get_level_treasures

    solucion  = 0
    
    hidden_treasures.each do |hidd|
      
      solucion = solucion + hidd.binus
      
    end
    
    visible_treasures.each do |vis|
      
      solucion = solucion + vis.binus
      
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
 
   private :get_combat_level   
   
   
   def increment_levels(i)
     
     if( @level + i >= MAXLEVEL )
        @level = MAXLEVEL
     
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
     
     if !@pending_bad_consequence.is_empty? and @hidden_treasures.length < 4
         
         solucion = false
     end
     
     solucion
  end   
 
  private :valid_state
 
  def how_many_visible_treasures(tKind)
      
      solucion = 0
      
      
    visible_treasures.each do |vis|
      
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
      
      if @hidden_treasures.lenght > 0  or @visible_treasures.lenght > 0 then 
         
          solucion = true
          
      end

    solucion 
  
  end
  
  private :can_you_give_me_a_treasure
     
end
