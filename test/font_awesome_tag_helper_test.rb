require 'test_helper'

class FontAwesomeTagHelperTest < ActiveSupport::TestCase
  test "module_loaded" do
    assert ActionView::Helpers.included_modules.include? FontAwesomeTagHelper
  end
end
