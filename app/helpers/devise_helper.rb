module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    if messages.is_a? String
      html = <<-HTML
        <div class="alert alert-<%= flash_class(level) %>">
          <button type="button" class="close" data-dismiss="alert">X</button>
          #{messages}
        </div>
      HTML
    end 

    html.html_safe
  end
end