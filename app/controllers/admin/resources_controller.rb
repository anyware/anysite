class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_user!
  
  def update_positions
  end
  
  def destroy
  end
  
  def edit
    @resource = Resource.find(params[:id])
  end
  
  def new
    @resource = Resource.new
  end
  
  def create
    @resource = Resource.new(params[:resource])
    @resource.folder = Folder.find(params[:target_id])
    @resource.folder && @resource.save
  end
  
  def show
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    @resource.update_attributes(params[:resource])
  end
end
