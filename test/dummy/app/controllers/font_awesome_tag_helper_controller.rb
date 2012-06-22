class FontAwesomeTagHelperController < ApplicationController
  def index
   @tag = params[:tag].to_sym
  end
end