class Admin::FoldersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @folder = Folder.find(params[:id])
  end
  
  def edit
    @folder = Folder.find(params[:id])
  end
  
  def update
    @folder = Folder.find(params[:id])
    @folder.update_attributes(params[:folder])
  end
  
  def tree_node
    @folder = Folder.find(params[:id])
  end
  
end
