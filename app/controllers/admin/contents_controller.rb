class Admin::ContentsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @content = Content.find(params[:id])
  end
  
  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(params[:content])
      flash[:notice] = 'Page was successfully updated.'
      render :partial => 'edit'
    else
      render :action => 'edit'
    end
  end
  
  def tree_node
    @content = Content.find(params[:id])
      # page.insert_html :bottom, 'folder_'+ @folder.id.to_s, :partial => 'tree_node', :locals => {:folder => @folder}
  end
  
end
