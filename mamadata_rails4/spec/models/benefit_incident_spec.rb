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

it "should raise an error when no benefit is specified" do
	@benefit_incident = BenefitIncident.new
	@benefit_incident.program = @program
	@benefit_incident.person = @person
	expect(@benefit_incident).not_to raise_error
end


end