module ApplicationHelper

	def is_admin?
		if current_user.role == "admin"
			return true
		else
			return false
		end
	end

	def is_accountant?
		if current_user.role == "accountant"
			return true
		else
			return false
		end
	end

	def is_supporter?
		if current_user.role == "supporter"
			return true
		else
			return false
		end
	end



end

class EnhancedFormBuilder < ActionView::Helpers::FormBuilder
  def select_with_other_field(object_name, method, options = {:selectContainerClass => '', :textFieldContainerClass => ''})
    # get all possible choices for property
    choices = []
    PossibleChoices.where(:property => method).each do |choice|
      choices << choice.value
    end
    choices << 'Other'

    # build template
    content = @template.content_tag(:div,
                @template.select(object_name, method, choices),
                {
                    :class => options[:selectContainerClass]
                })
    content += @template.content_tag(:div,
                @template.text_field(object_name, method, {:disabled => true}),
                {
                    :class => options[:textFieldContainerClass]
                })

    @template.content_tag(:div, content)
  end
end
# Set CustomBuilder as default FormBuilder
ActionView::Base.default_form_builder = EnhancedFormBuilder