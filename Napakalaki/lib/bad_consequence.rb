# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


#encoding: utf-8

class Bad_consequence
  attr_accessor :text ,:levels,:nVisibleTreasures,:nHiddenTreasures,:death,:specificVisibleTreasures, :specificHiddenTreasures
  
  private_class_method :new
  
  
  def initialize (t, l, n_v, n_h, s_v, s_h, d)
    @text = t
    @levels = l
    @nVisibleTreasures = n_v
    @nHiddenTreasures = n_h
    @death = d
    @specificVisibleTreasures = s_v
    @specificHiddenTreasures = s_h
    
  end
  
  def self.new_level_number_of_treasures(text,levels,nVisible,nHidden)
    
    new(text, levels ,nVisible, nHidden, Array.new, Array.new,false)
    
  end
  
  def self.new_level_specific_treasures(text,levels,tVisible,tHidden)
    
   new(text, levels ,0, 0, tVisible, tHidden, false)
    
  end
  
  def self.new_death(text)
    new(text, 0, 0, 0, Array.new, Array.new, true)
    
  end
  
  def to_s()
    "Mal rollo: #{@text} 
    \n Pierdes: #{@levels} niveles 
    \n y pierdes #{@nVisibleTreasures} tesoros visibles 
    \n y #{@nHiddenTreasures} tesoros ocultos
    \n muerte: #{@death} 
    \n Tipo de Tesoro Visible: #{@specificVisibleTreasures} 
    \n Tipo de Tesoro Oculto: #{@specificHiddenTreasures}."
  end
  
  
  def is_empty
     
    @solucion 
         if @text == "" and @levels == 0 and @nVisibleTreasures == 0 and  @nHiddenTreasures == 0 and @death ==false and @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
                    
              solucion = true
         end
               
    solucion;

  end
  
  def substract_visible_treasure(t)
    @specificVisibleTreasures.delete(t.type)
  end
  
  def substract_hidden_treasure(t)
    @specificHiddeTreasures.delete(t.type)
  end
  
  def adjust_to_fit_treasure_list(v, h)
            
        if specificHiddenTreasures.isEmpty? and specificVisibleTreasures.isEmpty?
           
                   visibles = 0
                   ocultos = 0

                    tamV = v.length
                    tamH = h.length

                    if nVisibleTreasures <= tamV
                        visibles = nVisibleTreasures

                    else 
                      if tamV < nVisibleTreasures
                        visibles = tamV;
                      end
                    end

                     if nHiddenTreasures <= tamH 
                        ocultos = nHiddenTreasures

                    else 
                      if tamH < nHiddenTreasures
                       ocultos = tamH
                      end
                     
                    end
                     
          bad_cons = new_level_number_of_treasures(@text, @levels, visibles, ocultos)                       
        else
        visible = Array.new
        hidden = Array.new
        
        v.each do |t|
            
            if visible.index(t.type) == nil 
                visible << t.type
            end
        end
        
        
        h.each do |t|
            
            if hidden.index(t.type) == nil 
                hidden << t.type
            end
        end  
        
        bad_cons = Bad_consequence.new_level_specific_treasures(@text, @levels, visible, hidden)     
    
    end
    bad_cons
  end
    
    def get_levels
       @levels
    end

  end
       
 
