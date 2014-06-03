require 'spec_helper'
	
describe BenefitIncident do 

	before :each do 
		@program = FactoryGirl.create(:program)
		@benefit = FactoryGirl.create(:benefit)
		@person = FactoryGirl.create(:person)
	end

it "should have a person to belong to" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.program = @program
	@benefit_incident.benefit = @benefit
	expect(@benefit_incident).not_to be_valid
end

it "should have a program to belong to" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.person = @person
	@benefit_incident.benefit = @benefit
	expect(@benefit_incident).not_to be_valid
end

it "should caluclate the right amount based on benefit optional_amount" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.program = @program
	@benefit_incident.person = @person
	@benefit.max_people = 10
	@benefit.optional_amount = 10000
	@benefit_incident.benefit = @benefit
	@benefit_incident.save
	expect(@benefit_incident.amount).to eq(@benefit.optional_amount/@benefit.max_people)
end

it "should caluclate the right amount based on benefit optional_amount" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.program = @program
	@benefit_incident.person = @person
	@benefit.fixed_amount = 1000
	@benefit_incident.benefit = @benefit
	@benefit_incident.save
	expect(@benefit_incident.amount).to eq(@benefit.fixed_amount)
end

it "should update the calculated amount when amount of benefit changes" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.program = @program
	@benefit_incident.person = @person
	@benefit.max_people = 10
	@benefit.optional_amount = 10000
	@benefit_incident.benefit = @benefit
	@benefit_incident.save
	expect(@benefit_incident.amount).to eq(@benefit.optional_amount/@benefit.max_people)
	@benefit.max_people = 20
	@benefit.should_receive(:update_calculated_amount_for_incidents)
	@benefit.save
	@benefit_incident.save
	expect(BenefitIncident.last.amount).to eq(@benefit.optional_amount/@benefit.max_people)
	@benefit.optional_amount = 20000
	@benefit.should_receive(:update_calculated_amount_for_incidents)
	@benefit.save
	@benefit_incident.save
	expect(BenefitIncident.last.amount).to eq(@benefit.optional_amount/@benefit.max_people)
end



end