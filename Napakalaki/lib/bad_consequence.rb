# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Bad_consequence
  attr_accessor :text ,:levels,:nVisibleTreasures,:nHiddenTreasures,:death
  def initialize
    @nVisibleTreasures = Array.new
  end
end
