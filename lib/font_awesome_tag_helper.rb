module FontAwesomeTagHelper
  def icon_tag(icon_name, options = {})

    class_options = options.collect do |option, option_value|
      value = option_value.to_s
      case option.to_sym
      when :size, :large # icon-large, icon-2x, icon-3x, icon-4x
        if (option.to_sym == :large && value != "false") || value == "large"
          "icon-large"
        elsif [2,3,4].include?(value.to_i)
          "icon-#{value.to_i}x"
        # else
        #   "icon-large"
        end
      when :border # icon-border
        "icon-border" unless value == "false"
      when :pull # pull-right pull-left
        case value
        when "right"
          "pull-right"
        when "left"
          "pull-left"
        end
      when :spin # icon-spin
        "icon-spin" unless value == "false"
      when :li, :list # icon-li
        "icon-li" unless value == "false"
      when :width # icon-fixed-width
        "icon-fixed-width" if value.match(/^fixed/).present?
      when :rotate # icon-rotate-90, icon-rotate-180, icon-rotate-270
        case value.to_i
        when 90
          "icon-rotate-90"
        when 180
          "icon-rotate-180"
        when 270
          "icon-rotate-270"
        end
      when :flip # icon-flip-horizontal, icon-flip-vertical
        case value
        when "horizontal"
          "icon-flip-horizontal"
        when "vertical"
          "icon-flip-vertical"
        end
      end
    end.uniq.reject(&:nil?)
    class_options.delete("icon-large") if class_options.include?("icon-large") && class_options.select{ |option| option =~ /icon-[2,3,4]x/ }.any?
    class_options.reject!{ |option| option =~ /^icon-rotate/ } if class_options.select{ |option| option =~ /^icon-rotate/ }.any? && class_options.select{ |option| option =~ /^icon-flip/ }.any?

    tag = "<i"
    tag += " id=\"#{options[:id].to_s}\"" if options[:id].present?
    tag += " name=\"#{options[:name].to_s}\"" if options[:name].present?
    tag += " class=\"#{class_options.unshift("icon-#{icon_name}").join(' ')}\""
    tag += "></i>"
    return tag.html_safe
  end
end

ActionView::Helpers.send :include, FontAwesomeTagHelper
