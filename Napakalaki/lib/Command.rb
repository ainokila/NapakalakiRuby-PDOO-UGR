# encoding: utf-8

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
module Test

  module Command  
    class Option
      attr_reader :menu, :text
      def initialize (aValue, aText)
        @menu = aValue
        @text = aText
      end
    end
    
    Exit = Option.new(0, "Salir")
    GoBack = Option.new(-1, "Menu anterior")
    Combat = Option.new(69, "¡¡ C O M B A T I R !!")
    ShowMonster = Option.new(10, "Mostrar monstruo")
    ShowVisibleTreasure = Option.new(11, "Mostrar tesoros visibles")
    ShowHiddenTreasure = Option.new(12, "Mostrar tesoros ocultos") 
    DiscardVisibleTreasure = Option.new(21, "Descartar tesoro visible")
    DiscardHiddenTreasure = Option.new(22, "Descartar tesoro oculto")
    DiscardAll = Option.new(23, "Descartar TODOS los tesoros")
    MakeTreasureVisible = Option.new(31, "Equipar tesoro")
    StealTreasure = Option.new(32, "Robar tesoro")
    NextTurn = Option.new(1, "Siguiente turno")
    NextTurnAllowed = Option.new(2, "Siguiente turno permitido")
    
  end # del modulo Command
end # del mmodulo Test
