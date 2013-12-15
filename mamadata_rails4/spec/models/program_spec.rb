require 'spec_helper'

describe Program do
	before :each do 
		@program = FactoryGirl.create(:program)
		@benefit = FactoryGirl.create(:benefit)
	end

  it "should have a name" do
  	@program.name = ' '
  	expect(@program).not_to be_valid
  end

  it "should be valid to add and remove benefits" do
  	@program.benefits << @benefit
  	expect(@program.benefits).to include(@benefit)

  	@program.benefits.delete(@benefit)
  	expect(@program.benefits).not_to include(@benefit)
  end

end
