class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_user!
  
  def update_positions
  end
  
  def destroy
    resource = Resource.find(params[:id])
    @folder = resource.folder
    resource.destroy
  end
  
  def edit
    @resource = Resource.find(params[:id])
    render "editor"
  end
  
  def new
    @folder = Folder.find(params[:folder_id])
    @resource =Resource.new
    render "editor"
  end
  
  def create
    @resource = Resource.new(params[:resource])
    @resource.folder = Folder.find(params[:target_id])
    @resource.folder && @resource.save
    render "form"
  end
  
  def show
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    @resource.update_attributes(params[:resource])
    render "editor"
  end
end
