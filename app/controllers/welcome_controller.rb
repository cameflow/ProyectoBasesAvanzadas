class WelcomeController < ApplicationController
  before_action :check_expired


  def home
  end

  private

  def check_expired
    @subingredients = Subingredient.all
    todaydat = Date.today
    checkdat = (todaydat+2).to_s
    expdate = (todaydat+4).to_s
    for sub in @subingredients
      if sub.exp_date == checkdat
        @ingredient = Ingredient.find_by(name: sub.name)
        subi = Subingredient.create(name: sub.name, exp_date: expdate, amount:10)
        rel = InStock.create(from_node: @ingredient, to_node: subi, isActive: true)
      else
        if sub.exp_date == todaydat || sub.exp_date < todaydat
          Neo4j::Session.current.query('MATCH (n:Ingredient) MATCH n-[rel1:IN_STOCK]->(result_subingredients:Subingredient) where n.name ='+"'" + sub.name + "'"+' set rel1.isActive = false')
        end
      end
    end

  end


end
