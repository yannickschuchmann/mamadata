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

  it "can contain benefits" do
  	@program.benefits << @benefit
  	expect(@program.benefits).to include(@benefit)
  end

end
