class AddExchangeRatesToBenefitIncident < ActiveRecord::Migration
  def change
    add_money :benefit_incidents, :amount_in_euro,  currency: {default: "EUR"}
    add_money :benefit_incidents, :amount_in_dollar, currency: {default: "USD"}
  end
end
