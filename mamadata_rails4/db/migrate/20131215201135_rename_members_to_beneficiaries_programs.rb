class RenameMembersToBeneficiariesPrograms < ActiveRecord::Migration
  def change
  	rename_table :members, :beneficiaries_programs
  end
end
