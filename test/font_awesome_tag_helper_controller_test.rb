require 'test_helper'
require 'font_awesome_tag_helper_controller'

class FontAwesomeTagHelperControllerTest < ActionController::TestCase
  test "generate_tag" do
    tag = "search"

    get :index, { :tag => tag }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_without_options" do
    tag = "search"

    get :index, { :tag => tag }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :attributes => { :id => nil }
    assert_tag :tag => 'i', :attributes => { :name => nil }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_basic_options" do
    tag = "search"
    options = { id: "search-box", name: "search" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_advanced_options" do
    tag = "search"
    options = { id: "search-box", name: "search", width: "fixed", size: "2x" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-fixed-width icon-2x" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_boolean_option" do
    tag = "search"
    options = { id: "search-box", name: "search", width: "fixed", large: true }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-fixed-width icon-large" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_boolean_string_option" do
    tag = "search"
    options = { id: "search-box", name: "search", width: "fixed", large: "true" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-fixed-width icon-large" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_false_boolean_option" do
    tag = "search"
    options = { id: "search-box", name: "search", width: "fixed", large: false }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-fixed-width" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_false_boolean_string_option" do
    tag = "search"
    options = { id: "search-box", name: "search", width: "fixed", large: "false" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-fixed-width" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_many_advanced_options" do
    tag = "search"
    options = { id: "search-box", name: "search", size: "4x", large: false, border: "true", pull: "left", spin: true, li: "false", list: "li", width: "fixed-width", rotate: 180, flip: "none" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-4x icon-border pull-left icon-spin icon-li icon-fixed-width icon-rotate-180" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_duplicate_options" do
    tag = "search"
    options = { id: "search-box", name: "search", size: "4x", large: true, li: "yes", list: "li", rotate: 180, flip: "horizontal" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag} icon-4x icon-li icon-flip-horizontal" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_tag_with_invalid_options" do
    tag = "search"
    options = { id: "search-box", name: "search", popup: true, flash: "Yes!", hidden: "okay" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :attributes => { :id => "search-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end

  test "generate_invalid_tag" do
    tag = "search-invalid"
    options = { id: "search-invalid-box", name: "search-invalid" }

    get :index, { :tag => tag, :options => options }
    assert_response 200
    assert_tag :tag => 'i', :attributes => { :class => "icon-#{tag}" }
    assert_tag :tag => 'i', :attributes => { :id => "search-invalid-box" }
    assert_tag :tag => 'i', :attributes => { :name => "search-invalid" }
    assert_tag :tag => 'i', :children => { :count => 0 }
    assert_tag :tag => 'i', :content => nil
  end
end
