require 'test_helper'
require 'font_awesome_tag_helper_controller'

class FontAwesomeTagHelperControllerTest < ActionController::TestCase
  test "generate_tags" do
    tag = 'search'
    
    get :index, { :tag => tag }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end
end