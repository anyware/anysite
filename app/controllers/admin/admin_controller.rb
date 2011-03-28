class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"

  def index
    @homepage = Content.first
    @resource_home = Folder.first
  end
end
