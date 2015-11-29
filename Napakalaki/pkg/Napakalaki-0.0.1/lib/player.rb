# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure'
require_relative 'bad_consequence.rb'
require_relative 'dice.rb'
require_relative 'combat_result.rb'


class Player
  attr_accessor :name, :level, :dead, :can_i_steal, :hidden_treasures, :visible_treasures, :enemy, :pending_bad_consequence
  
  @@CONST_MAXLEVEL = 10
  
  
   def initialize(name)
     
      @name = name 
      @dead = true
      #Inicializamos el nivel a 1
      @level = 1 
      @visible_treasures = Array.new
      @hidden_treasures = Array.new
      @can_i_steal = true
      @pending_bad_consequence = Bad_consequence.new_level_number_of_treasures('',0,0,0)
      
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
      
      solucion = solucion + hidd.bonus
      
    end
    
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
 
   private :get_combat_level   
   
   
   def increment_levels(i)
     
     if( @level + i >= CONST_MAXLEVEL )
        @level = CONST_MAXLEVEL
     
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
     
     if !@pending_bad_consequence.is_empty and @hidden_treasures.length > 4
         
         solucion = false
     end
     
     solucion
  end   
 
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
 
    def can_make_treasure_visible(t)
   
       solucion=true
       
         @visible_treasures.each do |iterador|
          
            contador_one_hand = 0
          
            if iterador.get_type == :onehand
          
                contador_one_hand = contador_one_hand + 1
             
            end
            
            if !(contador_one_hand <2) or t.get_type == :onehand
              
                if iterador.get_type == t.get_type
                      solucion= false
                      
                end
                
                if iterador.get_type == :bothhands and t.get_type  == :onehand  
                       solucion = false
                end
                
                if iterador.get_type == :onehand and t.get_type == :bothhands
                       solucion = false
                end
                
            end
             
         end
   solucion
end
 
 private :can_make_treasure_visible
 
    
  def apply_prize(m)
 
    self.increment_levels(m.get_levels_gained)
    tesoros = m.get_treasures_gained
    
    baraja = card_dealer.get_instance
        
        tesoros.each do |i|
          @hidden_treasures << baraja.next_treasure
          
        end
   end
   
  private :apply_prize
  
    def apply_bad_consequence(m)
      
      bad = m.get_bad_consequence
      niveles = bad.get_levels
      decrement_levels(niveles)
      
      pending_bad = @pending_bad_consequence
      
      pending_bad.adjust_to_fit_treasure_list(@visible_treasures,@hidden_treasures)
      
      @pending_bad_consequence = pending_bad
      
    end

  private :apply_bad_consequence
  
  def steal_treasure
    can_i = can_i_steal
    
    if(can_i)
      can_you = @enemy.can_you_give_me_a_treasure
      
      if(can_you)
        treasure = enemy.give_me_a_treasure
        @hidden_treasures << treasure
       #duda#
       have_stolen
        
      end
    end
    treasure
  end
  
  def  give_me_a_treasure
    
    maximo = @hidden_treasures.length
    
    pos_aleatorio = Random.rand(1...maximo)
    
    solucion = @hidden_treasures.at(pos_aleatorio)
    @hidden_treasures.delete(solucion)#queda por probar
    
   solucion   
  end

 private :give_me_a_treasure
  
  def discard_visible_treasure(t)
      
      @visible_treasures.delete(t)
      
      if @pending_bad_consequence != nil  and !@pending_bad_consequence.is_empty
           
          @pending_bad_consequence.substract_visible_treasure(t)
      
      die_if_no_treasures 
      
    end
  end
      
  
  
  def discard_hidden_treasure(t)
      
     @hidden_treasures.delete(t)
      
      if @pending_bad_consequence != nil  and !@pending_bad_consequence.is_empty
           
          @pending_bad_consequence.substract_hidden_treasure(t)
      
      die_if_no_treasures 
      
    end
  end
      
  
  def discard_all_treasures
    
     @visible_treasures.each do |treasure|
          discard_visible_treasure(t)
     end
      
      @hidden_treasures.each do |treasure|
          discard_hidden_treasure(t)
     end
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
          puts treasure
      end
      
      if number == 6
          treasure = dealer.next_treasure();
          @hidden_treasures << treasure
          puts treasure
          
      end
      puts 'tamanio de los vectores en init_tr'
      puts @hidden_treasures.size
 
  end
  
  def combat(m)
      
      
      my_level = get_combat_level
      monster_level = m.get_combatlevel
     
        
      if my_level > monster_level 
              
        apply_prize(m)
          
          if @level >= @@MAXLEVEL
            combate = NapakalakiGame::CombatResult::WINGAME
          
          else
            combate = NapakalakiGame::CombatResult::WIN
          end
         
      else
          apply_bad_consequence(m)
          
      combate = NapakalakiGame::CombatResult::LOSE
      end
      
      combate
  end
  
  def canISteal
    @can_i_steal
  end
 
  def make_treasure_visible(t)
      
      can_i = can_make_treasure_visible(t)
      
      if can_i
          @visible_treasures << t
          @hidden_treasures.delete(t);
      end
  end
  
  def getVisibleTreasures
    puts 'tamanio de los vectores visible'
    puts @visible_treasures.size
    @visible_treasures
  end
  
  def getHiddeTreasures
    puts 'tamanio de los vectores oculto'
    puts @hidden_treasures.size
   @hidden_treasures
  end
  
  def to_s
    "#{@name} Nivel: #{@level}" 
  end

end
