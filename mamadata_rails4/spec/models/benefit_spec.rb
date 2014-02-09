require 'spec_helper'

describe Benefit do
	before :each do 
		@program = FactoryGirl.create(:program)
		@benefit = FactoryGirl.create(:benefit)
	end
  
  it "should have a name" do
  	@benefit.name = ' '
  	expect(@benefit).not_to be_valid
  end

  it "should be associated with a program" do
  	@benefit.programs << @program
  	expect(@benefit.programs).to include(@program)
  end

  it "should be deleted from a program" do
  	@benefit.programs << @program
  	expect(@benefit.programs).to include(@program)
  	@benefit.programs.delete(@program)
  	expect(@benefit.programs).not_to include(@program)
  end

  it "should have an entry in join table when associated with program" do
  	expect{@benefit.programs << @program}.to change{ProgramBenefitRelationship.count}.by(1)
  end

	it "should delete the entry in join table when associated program is deleted" do
  	@benefit.programs << @program
  	expect{@benefit.programs.delete(@program)}.to change{ProgramBenefitRelationship.count}.by(-1)
  end

  it "should have max people set when optional amount is selected" do
    @benefit.optional_amount=1000
    expect(@benefit).not_to be_valid
    @benefit.max_people = 1
    expect(@benefit).to be_valid
  end

  it "should not have optional amount and fixed amount set at the same time" do
    @benefit.optional_amount=1000 
    @benefit.max_people= 1
    @benefit.fixed_amount=10000
    expect(@benefit).not_to be_valid
  end
end
