class AddExchangeRatesToBenefitIncident < ActiveRecord::Migration
  def change
    add_money :benefit_incidents, :amount_in_euro, amount: {postfix: '_cents'}, currency: {default: "EUR"}
    add_money :benefit_incidents, :amount_in_dollar, amount: {postfix: '_cents'}, currency: {default: "USD"}
  end
end
