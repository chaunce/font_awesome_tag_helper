class FontAwesomeTagHelperController < ApplicationController
  def index
   @tag = params[:tag].to_sym
   @options = params[:options] || {}
  end
end