
class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :add_to_family]
  before_filter :set_autosuggest
  layout "application_person", except: :index



  def index
    @people = Person.order(id: :desc).page(params[:page])
    sort_params = params[:sort]
    puts "sort params "
    puts params[:sort]
    unless sort_params.nil?
    	order_primary = params[:sort][:order_primary]
    	order_secondary = params[:sort][:order_secondary]
    	per_page_input = params[:sort][:per_page] == 'all' ? 10000 : params[:sort][:per_page]
    end
    sql_statement = ""
		unless order_primary.blank?
			attr_to_order_by_one = order_primary.split('#')[0]
			ordering_one = order_primary.split('#')[1]
			sql_for_first = "LOWER(#{attr_to_order_by_one}) #{ordering_one}"
			sql_statement += sql_for_first
		end
		unless order_secondary.blank?
			attr_to_order_by_second = order_secondary.split('#')[0]
			ordering_second = order_secondary.split('#')[1]
			sql_for_second = "LOWER(#{attr_to_order_by_second}) #{ordering_second}"
			sql_statement += ',' unless order_primary.blank?
			sql_statement += sql_for_second
		end

		if attr_to_order_by_one == 'total_expense' || attr_to_order_by_second == 'total_expense'
			array_to_order = Person.with_total_expense
			array_to_order = array_to_order.reverse if ordering_one == 'desc' or ordering_second == 'desc'
			@people = Kaminari.paginate_array(array_to_order)
		else
		@people = @people.order(sql_statement)
		end
		@people = @people.page(params[:page]).per(per_page_input)
  end

	# GET /people/1
	# GET /people/1.json
	def show
		@benefit_incidents = BenefitIncident.where(person_id: params[:id])
		@schools = School.where(person_id: params[:id])
		@godfather_relations = GodfatherPerson.with_deleted.where(person_id: params[:id]).order(created_at: :desc)
		@godfathers = []
		@godfather_relations.each do |r|
			@godfathers << Supporter.find(r.godfather_id)
		end
	end

	# GET /people/new
	def new
		@person = Person.new
	end

	def add_to_program
		@person = Person.find(params[:id])
	end

	# GET /people/1/edit
	def edit
		if params[:section] == "programs"
			render partial: 'program_checkboxes'
		end
	end

	# POST /people
	# POST /people.json
	def create
		@person = Person.create(person_params)
		@person.user = current_user
		# personParameters = ActionController::Parameters.new(params["person"])
		# @person = Person.create(personParameters.permit(:name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :pin_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id, :school_name, :school_type, :school_language, :school_class, :narrative_text,:avatar , :status,:program_ids => []))
#    if params["beneficiary"]
#     beneficiaryParameters = ActionController::Parameters.new(params["beneficiary"])
#    @beneficiary = Beneficiary.create(beneficiaryParameters.permit(:school_name))
#    end
	respond_to do |format|
		if @person.save
			format.html { redirect_to @person, notice: 'Person was successfully created.' }
			format.json { render action: 'show', status: :created, location: @person }
		else
			format.html { render action: 'new' }
			format.json { render json: @person.errors, status: :unprocessable_entity }
		end
	end
end

	# PATCH/PUT /people/1
	# PATCH/PUT /people/1.json
	def update
		respond_to do |format|
      @person.set_old_program_ids
			if @person.update(person_params)
        @person.family.update(name: @person.head_of_household) unless @person.family.nil?
				if params[:redirect_to_incident] == 'true'
					format.html { redirect_to new_benefit_incident_path(@person), notice: 'Person was successfully updated.' }
				elsif params[:redirect_to_user] == 'true'
					format.html {redirect_to edit_person_path(@person, anchor:'narText')}
				end
				format.html { redirect_to @person, notice: 'Person was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /people/1
	# DELETE /people/1.json
	def destroy
		@person.destroy
		respond_to do |format|
			format.html { redirect_to people_url }
			format.json { head :no_content }
		end
	end

	def search
		name = params['name']
		fname = params['fname']
		city = params['city']
		zipcode = params['zipcode']

		result = Person.where("name LIKE ? AND fathers_name LIKE ? AND city LIKE ? AND zip_code LIKE ?", "%#{name}%","%#{fname}%","%#{city}%","%#{zipcode}%")
		
		respond_to do |format|
			# format.html # index.html.erb
			format.json { render json: result }
		end
  end

  def report
  	@people = Person.find(params[:ids])
  	render :xlsx => "xlsreport", :filename => "beneficiary_report#{DateTime.now.to_i.to_s}.xlsx"
  end

  def profile
    redirect_to Person.create_pdf(params[:id])
  end

  def profiles
    require 'rubygems'
    require 'zip'

    paths = Person.create_pdf(params[:ids])
    t = Tempfile.new('tmp-zip-' + request.remote_ip)

    Zip::OutputStream.open(t.path) do |z|
      if paths.is_a? Array
        paths.each do |path|
          z.put_next_entry(path.split('/').last) # filename
          z.print IO.read("public/"+path)
        end
      else
        z.put_next_entry(paths.split('/').last) # filename
        z.print IO.read("public/"+paths)
      end
    end

    send_file t.path, :type => "application/zip", :filename => "profiles_#{Time.now.to_i.to_s}.zip", :disposition => 'attachment'
    t.close
  end

  def snapshot
    @people = params[:ids] ? Person.find(params[:ids]) : Person.all
    
    Prawn::Document.generate('public/system/people/reports/pdf/snapshot.pdf',:page_layout => :landscape) do |pdf|
      pdf.font_size(25) { pdf.text "Beneficiaries Report" }
      content = [Person.real_attribute_names]
      @people.each do |p|
        line = []
        Person.real_attribute_names.each do |attr|
          attr = attr.gsub(' ', '_').downcase
          line << p[attr].to_s
        end
        content << line
      end
      pdf.table(content, :header => true)
    end

    respond_to do |format|
    	format.pdf { send_file 'public/system/people/reports/pdf/snapshot.pdf',:filename => "snapshot_#{Time.now.to_i.to_s}.pdf", :type => "application/pdf", :disposition => 'attachment'}
    	# format.xlsx {render :xlsx => "xlsreport", :filename => "beneficiary_report#{DateTime.now.to_i.to_s}.xlsx"}
    end
  end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_autosuggest
			@AutoNames  = Person.select('distinct name').collect { |p| p.name.camelize }
			@AutoFatherNames = Person.select('distinct fathers_name').collect { |p| p.fathers_name.camelize }
			@AutoZipCode  = Person.select('distinct zip_code').collect { |p| 
                                                                            if(p.zip_code != nil)
                                                                                p.zip_code.camelize
                                                                            end
                                                                        }
			@AutoCities = Person.select('distinct city').collect { |p| p.city.camelize }
			@AutoNameOfTheStreet  = Person.select('distinct name_of_the_street').collect { |p| p.name_of_the_street.camelize }
			@AutoBirthPlace  = Person.select('distinct place_of_birth').collect { |p| p.place_of_birth.camelize }
			@AutoNativePlace  = Person.select('distinct native_place').collect { |p| p.native_place.camelize }
		end
		def set_person
			@person = Person.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def person_params
			params.require(:person).permit(:name, :fathers_name, :file_number, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :area, :zip_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id, :school_name, :school_type, :school_language, :school_class, :narrative_text,:avatar, :status, :godfather_ids, :head_of_household, :program_ids => [])
    end

	end
