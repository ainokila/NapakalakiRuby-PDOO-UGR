# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'

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
      @unused_treasures << Treasure.new("¡Si mi amo!", 4, HELMET)
      @unused_treasures << Treasure.new("Botas de investigación", 3, SHOES)
      @unused_treasures << Treasure.new("Capucha de Cthulhu", 3, 5, HELMET)
      @unused_treasures << Treasure.new("A prueba de babas",  2, 5, ARMOR)
      @unused_treasures << Treasure.new("Botas de lluvia ácida", 1, 1, BOTHHAND)
      @unused_treasures << Treasure.new("Casco minero", 2, 4, HELMET)
      @unused_treasures << Treasure.new("Ametralladora Thompson", 4, 8, BOTHHAND)
      @unused_treasures << Treasure.new("Camiseta de la UGR", 1, 7, ARMOR)
      @unused_treasures << Treasure.new("Clavo de rail ferroviario", 3, 6, ONEHAND)
      @unused_treasures << Treasure.new("Cuchillo de sushi arcano", 2, 3, ONEHAND)
      @unused_treasures << Treasure.new("Fez alópodo", 3, 5, HELMET)
      @unused_treasures << Treasure.new("Hacha prehistórica", 2, 5, ONEHAND)
      @unused_treasures << Treasure.new("El aparato del Pr. Tesla", 4, ARMOR)
      @unused_treasures << Treasure.new("Gaita", 4, BOTHHAND)
      @unused_treasures << Treasure.new("Insecticida", 2, ONEHAND)
      @unused_treasures << Treasure.new("Escopeta de 3 cañones", 4, BOTHHAND)
      @unused_treasures << Treasure.new("Garabato Mistico", 2, ONEHAND)
      @unused_treasures << Treasure.new("La fuerza de Mr. T", 0, ONEHAND)
      @unused_treasures << Treasure.new("La rebeca metálica",  2, ARMOR)
      @unused_treasures << Treasure.new("Mazo de los antiguos", 3, ONEHAND)
      @unused_treasures << Treasure.new("Necro-playboycon", 3, ONEHAND)
      @unused_treasures << Treasure.new("Lanzallamas", 4, BOTHHAND)
      @unused_treasures << Treasure.new("Necro-comicón",  1, ONEHAND)
      @unused_treasures << Treasure.new("Necronomicón",5, BOTHHAND)
      @unused_treasures << Treasure.new("Linterna a 2 manos", 3, BOTHHAND)
      @unused_treasures << Treasure.new("Necro-gnomicón",2, ONEHAND)
      @unused_treasures << Treasure.new("Necrotelecom", 2, HELMET)
      @unused_treasures << Treasure.new("Porra preternatural", 2,  ONEHAND)
      @unused_treasures << Treasure.new("Tentácula de pega", 0,  HELMET)
      @unused_treasures << Treasure.new("Zapato deja-amigos",  0,  SHOE)
      @unused_treasures << Treasure.new("Shogulador", 1, BOTHHAND)
      @unused_treasures << Treasure.new("Varita de atizamiento", 3,ONEHAND)
    
    
  end
  
  def init_monster_card_deck
    #Crear los treasures
        #Monstruo 1

    prize1 = Prize.new(2,1)

    bad_consequence1 = Bad_consequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta.', 0 ,[TreasureKind::ARMOR],[TreasureKind::ARMOR])

    unused_treasures << Monster.new('Byakhees de bonanza', 8, bad_consequence1, prize1)

    #Monstruo 2

    prize2 = Prize.new(1,1)

    bad_consequence2 = Bad_consequence.new_level_specific_treasures('Embobados con el lindo primigenio te descartas de tu casco visible.', 0 ,[TreasureKind::HELMET],[])

    unused_treasures << Monster.new('Chibithulhu', 2, bad_consequence2, prize2)

    #Monstruo 3

    prize3 = Prize.new(1,1)

    bad_consequence3 = Bad_consequence.new_level_specific_treasures('El primordial bostezo contagioso. Pierdes el calzado visible.', 0 ,[TreasureKind::SHOES],[])

    unused_treasures << Monster.new('EL sopor de Dunwich', 2, bad_consequence3, prize3)


    #Monstruo 4

    prize4 = Prize.new(4,1)

    bad_consequence4 = Bad_consequence.new_level_specific_treasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.', 0,
      [TreasureKind::ONEHAND],[TreasureKind::ONEHAND])

    unused_treasures << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence4, prize4)

    #Monstruo 5

    prize5 = Prize.new(3,1)

    bad_consequence5 = Bad_consequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles.', 0 ,6,0)

    unused_treasures << Monster.new('El gorron en el umbral', 10, bad_consequence5, prize5)

    #Monstruo 6

    prize6 = Prize.new(2,1)

    bad_consequence6 = Bad_consequence.new_level_specific_treasures('Pierdes tu armadura visible.', 0, [TreasureKind::ARMOR],[])

    unused_treasures << Monster.new('H.P. Munchcraft', 6, bad_consequence6, prize6)

    #Monstruo 7

    prize7 = Prize.new(1,1)

    bad_consequence7 = Bad_consequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descartas la armadura visible.', 0, [TreasureKind::ARMOR],[])

    unused_treasures << Monster.new('Bichgooth', 2, bad_consequence7, prize7)


    #Monstruo 8

    prize8 = Prize.new(4,2)

    bad_consequence8 = Bad_consequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)

    unused_treasures << Monster.new('El rey de rosa',13 , bad_consequence8 , prize8)

    #Monstruo 9

    prize9 = Prize.new(1,1)

    bad_consequence9 = Bad_consequence.new_level_number_of_treasures('Toses los pulmones y pierdes 2 niveles.',2 ,0, 0)

    unused_treasures << Monster.new('La que redacta en las tinieblas',2 , bad_consequence9 , prize9)

    #Monstruo 10

    prize10 = Prize.new(4,2)

    bad_consequence10 = Bad_consequence.new_death('Estos monstruos resultan bastantes superficiales y te aburren mortalmente. Estas muerto.')

    unused_treasures << Monster.new('Los hondos',8 , bad_consequence10 , prize10)

    #Monstruo 11

    prize11 = Prize.new(2,1)

    bad_consequence11 = Bad_consequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos.',2 , 0, 2)

    unused_treasures << Monster.new('Semillas Cthulhu',4, bad_consequence11 , prize11)

    #Monstruo 12

    prize12 = Prize.new(2,1)

    bad_consequence12 = Bad_consequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible.', 0, [TreasureKind::ONEHAND],[])

    unused_treasures << Monster.new('Dameargo',1, bad_consequence12 , prize12)

    #Monstruo 13

    prize13 = Prize.new(1,1)

    bad_consequence13 = Bad_consequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles.',3 , 0, 0)

    unused_treasures << Monster.new('Pollipolipo volante',3, bad_consequence13 , prize13)

    #Monstruo 14

    prize14 = Prize.new(3,1)

    bad_consequence14 = Bad_consequence.new_death('No le hace gracia que pronuncien mal su nombre. Estas muerto.')

    unused_treasures << Monster.new('Yskhtihyssg-Goth',12 , bad_consequence14 , prize14)

    #Monstruo 15

    prize15 = Prize.new(4,1)

    bad_consequence15 = Bad_consequence.new_death('La familia te atrapa. Estas muerto.')

    unused_treasures << Monster.new('Familia feliz',1 , bad_consequence15 , prize15)

    #Monstruo 16

    prize16 = Prize.new(2,1)

    bad_consequence16 = Bad_consequence.new_level_specific_treasures('La quinta directiva te obliga a perder 2 niveles y un tesoro de 2 manos visible.', 2, [TreasureKind::BOTHHANDS],[])

    unused_treasures << Monster.new('Roboggoth',8, bad_consequence16 , prize16)

    #Monstruo 17

    prize17 = Prize.new(1,1)

    bad_consequence17 = Bad_consequence.new_level_specific_treasures('Te asusta en la noche. Pierdes un casco visible.', 0, [TreasureKind::HELMET],[])

    unused_treasures << Monster.new('El espia',5, bad_consequence17 , prize17)

    #Monstruo 18

    prize18 = Prize.new(1,1)

    bad_consequence18 = Bad_consequence.new_level_number_of_treasures('Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles.',2 , 5, 0)

    unused_treasures << Monster.new('El lenguas',20, bad_consequence18 , prize18)

    #Monstruo 19

    prize19 = Prize.new(1,1)

    bad_consequence19 = Bad_consequence.new_level_specific_treasures('Te faltan manos para tanta cabeza. Pierdes todos tus tesoros visibles de las manos.', 0,
                            [TreasureKind::BOTHHANDS,TreasureKind::ONEHAND,TreasureKind::ONEHAND],[])

    unused_treasures << Monster.new('Bicefalo',20, bad_consequence19 , prize19) 
    #puts monsters

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
