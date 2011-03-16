class Admin::ContentsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @content = Content.find(params[:id])
  end
end
