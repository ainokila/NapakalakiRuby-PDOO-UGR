# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


#encoding: utf-8
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'


monsters = Array.new

#Monstruo 1

prize1 = Prize.new(2,1)

bad_consequence1 = Bad_consequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta.', 0 ,[TreasureKind::ARMOR],[TreasureKind::ARMOR])

monsters << Monster.new('Byakhees de bonanza', 8, bad_consequence1, prize1)

#Monstruo 2

prize2 = Prize.new(1,1)

bad_consequence2 = Bad_consequence.new_level_specific_treasures('Embobados con el lindo primigenio te descartas de tu casco visible.', 0 ,[TreasureKind::HELMET],[])

monsters << Monster.new('Chibithulhu', 2, bad_consequence2, prize2)

#Monstruo 3

prize3 = Prize.new(1,1)

bad_consequence3 = Bad_consequence.new_level_specific_treasures('El primordial bostezo contagioso. Pierdes el calzado visible.', 0 ,[TreasureKind::SHOES],[])

monsters << Monster.new('EL sopor de Dunwich', 2, bad_consequence3, prize3)


#Monstruo 4

prize4 = Prize.new(4,1)

bad_consequence4 = Bad_consequence.new_level_specific_treasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.', 0,
  [TreasureKind::ONEHAND],[TreasureKind::ONEHAND])

monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence4, prize4)

#Monstruo 5

prize5 = Prize.new(3,1)

bad_consequence5 = Bad_consequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles.', 0 ,6,0)

monsters << Monster.new('El gorron en el umbral', 10, bad_consequenc5, prize5)

#Monstruo 6

prize6 = Prize.new(2,1)

bad_consequence6 = Bad_consequence.new_level_specific_treasures('Pierdes tu armadura visible.', 0, [TreasureKind::ARMOR],[])

monsters << Monster.new('H.P. Munchcraft', 6, bad_consequence6, prize6)

#Monstruo 7

prize7 = Prize.new(1,1)

bad_consequence7 = Bad_consequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descartas la armadura visible.', 0, [TreasureKind::ARMOR],[])

monsters << Monster.new('Bichgooth', 2, bad_consequence7, prize7)


#Monstruo 8

prize8 = Prize.new(4,2)

bad_consequence8 = Bad_consequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)

monsters << Monster.new('El rey de rosa',13 , bad_consequence8 , prize8)

#Monstruo 9

prize9 = Prize.new(1,1)

bad_consequence9 = Bad_consequence.new_level_number_of_treasures('Toses los pulmones y pierdes 2 niveles.',2 ,0, 0)

monsters << Monster.new('La que redacta en las tinieblas',2 , bad_consequence9 , prize9)

#Monstruo 10

prize10 = Prize.new(4,2)

bad_consequence10 = Bad_consequence.new_death('Estos monstruos resultan bastantes superficiales y te aburren mortalmente. Estas muerto.')

monsters << Monster.new('Los hondos',8 , bad_consequence10 , prize10)

#Monstruo 11

prize11 = Prize.new(2,1)

bad_consequence11 = Bad_consequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos.',2 , 0, 2)

monsters << Monster.new('Semillas Cthulhu',4, bad_consequence11 , prize11)

#Monstruo 12

prize12 = Prize.new(2,1)

bad_consequence12 = Bad_consequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible.', 0, [TreasureKind::ONEHAND],[])

monsters << Monster.new('Dameargo',1, bad_consequence12 , prize12)

#Monstruo 13

prize13 = Prize.new(1,1)

bad_consequence13 = Bad_consequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles.',3 , 0, 0)

monsters << Monster.new('Pollipolipo volante',3, bad_consequence13 , prize13)


 
puts monsters

