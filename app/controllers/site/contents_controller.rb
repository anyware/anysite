class Site::ContentsController < ApplicationController
  layout 'site'
  
  def show
    @content = Content.find(params[:id])
  end
end
