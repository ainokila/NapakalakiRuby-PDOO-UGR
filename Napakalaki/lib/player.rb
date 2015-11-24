# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure'
require_relative 'bad_consequence'

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
  ##
 ## private boolean canMakeTreasureVisible(Treasure t){
  ##    
  ##    boolean solucion=true;
  ##    
  ##    for(Treasure iterador  : visibleTreasures){
  ##        int contadorOneHand = 0;
  ##        
 ##         if(iterador.getType() == TreasureKind.ONEHAND){
  ##            contadorOneHand++;
  ##        }
  ##        if(!(contadorOneHand<2 || t.getType()==TreasureKind.ONEHAND)){
   ##           
   ##             if(iterador.getType() == t.getType()){
    ##            solucion = false;
    ##            }
     ##           if(iterador.getType()==TreasureKind.BOTHHANDS && t.getType() == TreasureKind.ONEHAND  ){
     ##               solucion = false;
    ##            }
     ##           if(iterador.getType()==TreasureKind.ONEHAND && t.getType() == TreasureKind.BOTHHANDS ){
     ##               solucion = false;
      ##          }
      ##    }
     ##     
    ##      
   ##   }
    ##  
  ##    return solucion;
 ##}
 ## 
 ## private void applyPrize(Monster m){
  ######    this.incrementLevels(m.getLevelsGained());
  ##    int tesoros = m.getTreasuresGained();
    ##  
    ##  CardDealer baraja = CardDealer.getInstance();
    ##  
    ##  for(int i = 0 ; i<tesoros ; i++){
    ##      hiddenTreasures.add(baraja.nextTreasure());
    ##  }
  ##}
  ##
 ## private void applyBadConsequence(Monster m){
   ##   
   ##   BadConsequence bad = m.getBadConsequence();
   ##   
   ##   int niveles = bad.getLevels();
   ##   
   ##   this.decrementLevels(niveles);
   ## 
   ##   BadConsequence pendingBad = pendingBadConsequence; // Si no le daba un valor inicial e igualaba directamente, daba error.
   ##   
   ##   pendingBad.adjustToFitTreasureLists(visibleTreasures,hiddenTreasures);
   ##   
   ##   this.setPendingBadConsequence(pendingBad);
   ##   
  ##}
  ##
  ## public Treasure stealTreasure(){
    ##  boolean canI = this.canISteal();
     ## Treasure treasure = null;
     ## 
     ## if(canI){
       ##   boolean canYou = enemy.canYouGiveMeATreasure();
       ##   if(canYou){
       ##       treasure=enemy.giveMeATreasure();
       ##       this.hiddenTreasures.add(treasure);
       ##       this.haveStolen();
       ##   }
      ##}
      ## return treasure;
  ## }
  ##
 ## private Treasure giveMeATreasure(){
 ##      
 ##      Treasure solucion;
 ##      int posAleatorio = (int) Math.random()*hiddenTreasures.size();
 ##      solucion = hiddenTreasures.get(posAleatorio);
 ##      
 ##      return solucion;
 ## }
 ## AQUI EMPIEZO YO
 ##
  def discard_visible_treasure(t)
      
      @visible_treasures.remove(t)
      
      if @pending_bad_consequence != nil  and !@pending_bad_consequence.is_empty
           
          @pending_bad_consequence.substract_visible_treasure(t)
      
      die_if_no_treasures 
      
    end
  end
      
  
  
  public void discardHiddenTreasure(Treasure t){
      
      hiddenTreasures.remove(t);
      
      if((pendingBadConsequence != null) && (!pendingBadConsequence.isEmpty())){
            pendingBadConsequence.substractHiddenTreasure(t);
      }
       
      dieIfNoTreasures();
  }
  
  public void discardAllTreasures(){
      for(Treasure treasure : visibleTreasures){
          this.discardVisibleTreasure(treasure);
      }
      for(Treasure treasure : hiddenTreasures){
          this.discardHiddenTreasure(treasure);
      }
  }
  
  public void initTreasures(){
      CardDealer dealer = CardDealer.getInstance();
      Dice dice = Dice.getInstance();
      
      this.bringToLife();
      
      Treasure treasure = dealer.nextTreasure();
      hiddenTreasures.add(treasure);
      
      int number = dice.nextNumber();
      
      if(number>1){
          treasure = dealer.nextTreasure();
          hiddenTreasures.add(treasure);
      }
      
      if(number == 6){
          treasure = dealer.nextTreasure();
          hiddenTreasures.add(treasure);
          
      }
  }
  
  public CombatResult combat(Monster m){
      CombatResult combatResult;
      int myLevel = getCombatLevel();
      int monsterLevel = m.getCombatLevel();
      
      if(myLevel > monsterLevel){
          applyPrize(m);
          
          if(level >=MAXLEVEL){
                combatResult = CombatResult.WINGAME;
          }
          else{
               combatResult = CombatResult.WIN;
          }
          
      }
      else{
          applyBadConsequence(m);
          
          combatResult = CombatResult.LOSE;
      }
      
      return combatResult;
      
  }
  
  public void makeTreasureVisible(Treasure t){
      
      boolean canI = canMakeTreasureVisible(t);
      
      if(canI){
          visibleTreasures.add(t);
          hiddenTreasures.remove(t);
      }
  }
}
end
