class FamiliesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_family, only: [:show, :edit, :update, :destroy]

	def index
		@families = Family.all
		@heads = []
		@families.each do |familie|
			if Person.find_by_id(familie.head_id.to_i).nil?
				@heads << Person.new(name: "Unknown")
			else
				@heads << Person.find_by_id(familie.head_id.to_i)
			end
		end
		#puts @heads
	end
	
	def destroy
		@family.destroy
		respond_to do |format|
			format.html { redirect_to families_url }
			format.json { head :no_content }
		end
	end
	def delete_relation
		@person = Person.find(params[:id])
		unless @person.nil?
      family = Family.find(@person.family_id)
			@person.family_id = "" 
			@person.save
      if family.people.empty?
        family.destroy
        redirect_to families_path
      else
        family.save
        redirect_to edit_family_path family.id
      end
    else
      redirect_to families_path
    end
	end

	def edit
	end

	def new
		@family = Family.new
	end

  def update
    @people = params[:people]
    person_ids = get_validated_person_ids @people
    if person_ids
      @community = CommunityDevelopment.find(@family.community_development_id)
      @people.each do |value|
        value = value[1]
        person = Person.find(value["person_id"].to_i)
        person.update(role: Role.find_by_id(value["role_id"].to_i), family_id: @family.id)
      end
      @family.save
      redirect_to family_path @family.id
    else
      redirect_to edit_family_path @family.id
    end
  end

  def create
		@people = params[:people]
    person_ids = get_validated_person_ids @people
    if person_ids
      @family = Family.create
      @community = @family.create_community_development
      @people.each do |value|
        value = value[1]
        person = Person.find(value["person_id"].to_i)
        debugger
        person.update(role: Role.find_by_id(value["role_id"].to_i), family_id: @family.id)
      end
      @family.save
		  redirect_to family_path @family.id
    else
      redirect_to new_family_path
    end
  end

	def show
		@community = CommunityDevelopment.find(@family.community_development_id)
	end

	private
  def set_family
		@family = Family.find(params[:id])
  end

  def get_validated_person_ids people_hashes
    person_ids = []
    head_of_household_exists = false
    people_hashes.each do |person_hash|
      person_hash = person_hash[1]
      role_id = person_hash["role_id"].to_i
      unless head_of_household_exists then head_of_household_exists = role_id == 1 else return false if role_id == 1 end
      person_ids << person_hash["person_id"].to_i
    end unless people_hashes.nil?
    head_of_household_exists ? person_ids : false
  end
end