class Admin::ContentsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    
  end
  
  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
  end
  
  def tree_node
    @content = Content.find(params[:id])
  end
  
end
