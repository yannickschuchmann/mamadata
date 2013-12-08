class PlaygroundController < ApplicationController
  def familytest
  	@person = Person.first
  	 
	#@ancestors = getAncestors(@person,0)
	@children = getChildren(Person.find_by_id(8),0)
  end

	private
	def getAncestors(person,depth)
		# check if the the main array is created
		if @familyTree == nil
			@familyTree = []
		end
		#check if the ancestors level array is created
		if @familyTree[depth] == nil
			@familyTree[depth] = []
		end
		#save is on the right depth level
		@familyTree[depth] << person.id
		#check i ther is a father for that person
		if !(person.father_id == nil)
			fID = person.father_id
			getAncestors(Person.find_by_id(fID),depth+1)
		end
		#check if there is a mother for that person
		if !(person.mother_id == nil)
			mID = person.mother_id
			getAncestors(Person.find_by_id(mID),depth+1)
		end
		#return the array
		return @familyTree
	end
	def getChildren(person,depth)
		if @children == nil
			@children = []
		end
		#find all persons children
		if depth == 0
			if person.gender == "male"
				fID = Person.find_all_by_father_id(person.id)
				@children << fID
			elsif person.gender == "female"
				mID = Person.find_all_by_mother_id(person.id).take
				@children << mID.id
			end	
		end	
		return @children
	end
end