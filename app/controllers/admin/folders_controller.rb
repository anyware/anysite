class Admin::FoldersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @folder = Folder.find(params[:id])
  end
  
  def edit
    @folder = Folder.find(params[:id])
    render "editor"
  end
  
  def new
    @target = Folder.find(params[:target_id])
    @folder = Folder.new
    render "editor"
  end
  
  def update
    @folder = Folder.find(params[:id])
    @folder.update_attributes(params[:folder])
  end
  
  def create
    @parent = Folder.find(params[:target_id])
    @folder = @parent.children.new(params[:folder])
    @folder.save
    render "form"
  end
  
  def destroy
    child = Folder.find(params[:id])
    @folder = child.parent
    child.destroy
  end
  
  def tree_node
    @folder = Folder.find(params[:id])
  end
  
  def order_resources
    params[:folder_resources].each_with_index do |id, position|
      Resource.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
  def order_folders
    params[:folder_folders].each_with_index do |id, position|
      Folder.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
end
