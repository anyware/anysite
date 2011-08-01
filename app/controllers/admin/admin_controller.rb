class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"

  def index
    @content = Content.first
    @folder = Folder.first
  end
  
  def lorem
    render :layout => false
  end
end
