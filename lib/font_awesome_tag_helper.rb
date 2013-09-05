module FontAwesomeTagHelper
  def icon_tag(icon_name, options = {})
    tag = "<i"
    tag += " id=\"#{options[:id].to_s}\"" if options[:id].present?
    tag += " class=\"#{(["icon-#{icon_name}"] + options[:classes].to_a).join(' ')}\""
    tag += " name=\"#{options[:name].to_s}\"" if options[:name].present?
    tag += "></i>"
    return tag.html_safe
  end
end

ActionView::Helpers.send :include, FontAwesomeTagHelper
