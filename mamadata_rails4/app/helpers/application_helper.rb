module ApplicationHelper

  def person_school_path(school)
    person_path(school.person_id, :anchor => "school")
  end

  def number_to_indian_currency(number, html=true)
    txt = html ? content_tag(:span, 'Rs.', :class => :WebRupee) : 'Rs.'
    "#{txt} #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}"
  end


end

class EnhancedFormBuilder < ActionView::Helpers::FormBuilder
  def select_with_other_field(object_name, method, options = {:selectContainerClass => '', :textFieldContainerClass => '', :include_blank => false})
    # get all possible choices for property
    choices = []
    PossibleChoices.where(:property => method).each do |choice|
      choices << choice.value
    end
    choices << 'other'

    # build template
    content = @template.content_tag(:div,
                @template.select(object_name, method, choices, include_blank: options[:include_blank]),
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