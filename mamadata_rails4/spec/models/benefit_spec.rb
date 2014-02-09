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
    expect(@program.benefits).to include(@benefit)
  	@benefit.programs.delete(@program)
  	expect(@benefit.programs).not_to include(@program)
    expect(@program.benefits).not_to include(@benefit)
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

  it "should be possible to set a fixed amount" do
    @benefit.fixed_amount = 100
    expect(@benefit).to be_valid
  end

  it "should have valid numbers for fixed amounts" do
    @benefit.fixed_amount = 'aaa'
    expect(@benefit).not_to be_valid
    @benefit.fixed_amount = -1
    expect(@benefit).not_to be_valid
    @benefit.fixed_amount = '   '
    expect(@benefit).to be_valid
    @benefit.fixed_amount = 0
    expect(@benefit).to be_valid
  end

  it "should have valid numbers for calculated amounts" do
    @benefit.max_people = 10
    @benefit.optional_amount = 'aaa'
    expect(@benefit).not_to be_valid
    @benefit.optional_amount = -1
    expect(@benefit).not_to be_valid
    @benefit.optional_amount = 0
    expect(@benefit).to be_valid
    @benefit.optional_amount = '   '
    expect(@benefit).to be_valid
    @benefit.max_people = 0
    expect(@benefit).not_to be_valid
    @benefit.max_people = -1
    expect(@benefit).not_to be_valid
  end

  # it "should update the calculated amount of incidents" do
  #   incident = double("BenefitIncident", :benefit => @benefit)
  #   @benefit.max_people = 10    
  #   @benefit.optional_amount = 10000
  #   allow(incident).to receive(:amount).and_return(@benefit.optional_amount/@benefit.max_people)
  #   expect(incident.amount).to eq(@benefit.optional_amount/@benefit.max_people)
  #   @benefit.max_people = 20
  #   @benefit.save
  #   allow(incident).to receive(:amount).and_return(@benefit.optional_amount/@benefit.max_people)
  #   expect(incident.amount).to eq(@benefit.optional_amount/@benefit.max_people)
  # end
end
