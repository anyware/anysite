class Site::ContentsController < ApplicationController
  layout 'site'
  
  def show
    @content = Content.find(params[:id])
  end
  
  def by_url
    @content = Content.find_by_url(params[:url])
    render 'show'
  end
  
  def index
    @content = Content.first
    render 'show'
  end
end
