module DeviseHelper

  def devise_error_messages!
    return "" unless devise_error_messages?
    
    messages = resource.errors.full_messages.map { |msg| 
      javascript_tag "toastr['info']('#{msg}')"
    }.join    
    
    messages.html_safe
    
  end

  def devise_error_messages? 
    return false
    !resource.errors.empty? || !resource.errors.nil?
  end

=begin 

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
=end
end