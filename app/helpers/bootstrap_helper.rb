module BootstrapHelper
  def bootstrap_flash
    output = []

    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'danger' if type == 'alert'

      output << content_tag(:div, class: "alert alert-#{type} alert-dismissable") do
        content_tag(:button, '&times;'.html_safe, type: 'button', class: 'close', data: {dismiss: 'alert'}, 'aria-hidden' => true) + message
      end
    end

    output.join('<br />').html_safe
  end
end
