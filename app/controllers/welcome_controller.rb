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
        Subingredient.create(name: sub.name, exp_date: expdate, amount:1)
      else
        if sub.exp_date == todaydat || sub.exp_date < todaydat
          sub.valido = false
          sub.save
        end
      end
    end

  end



end
