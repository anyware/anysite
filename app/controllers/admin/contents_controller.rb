class Admin::ContentsController < ApplicationController
  before_filter :authenticate_user!
  
  def update_positions
  end
  
  def destroy
    child = Content.find(params[:id])
    @content = child.parent
    child.destroy
  end
  
  def edit
    @content = Content.find(params[:id])
    render :editor
  end
  
  def new
    @parent = Content.find(params[:parent_id])
    @content = Content.new
    render :editor
  end
  
  def create
    @parent = Content.find(params[:target_id])
    @content = @parent.children.new(params[:content])
    @content.save
    render "form"
  end
  
  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
    render "form"
  end
  
  def tree_node
    @content = Content.find(params[:id])
  end
  
  def order
    params[:content_contents].each_with_index do |id, position|
      Content.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
end
