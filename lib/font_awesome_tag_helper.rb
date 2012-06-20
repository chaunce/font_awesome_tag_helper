module FontAwesomeTagHelper
  def icon_tag(icon_name, options = {})
    tag = "<i"
    tag += " id=\"#{options[:id].to_s}\"" if options[:id].present?
    tag += " name=\"#{(options[:id] || options[:name]).to_s}\"" if options[:id].present? || options[:name].present?
    tag += " class=\"#{(["icon-#{icon_name}"] + options[:classes].to_a).join(' ')}\""
    tag += "></i>"
    return tag.html_safe
  end
end

ActionView::Helpers.send :include, FontAwesomeTagHelper
