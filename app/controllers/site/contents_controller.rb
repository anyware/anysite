class Site::ContentsController < ApplicationController
  layout 'site'
  
  def show
    @content = Content.find(params[:id])
  end
  
  def index
    @content = Content.first
    render 'show'
  end
end
