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
    render "editor"
  end
  
  def update
    @content = Content.find(params[:id])
    if(params[:content][:name])
      old_slug = @content.slug
      params[:content][:slug]=UrlHelper.slug(params[:content][:name])
      params[:content][:url]=UrlHelper.url(@content, params[:content][:name])
    end
    if @content.update_attributes(params[:content])
      UrlHelper.update_children_urls(@content) if old_slug != @content.slug
      puts "Gravado com sucesso"
    end
    render "update"
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
  
  def order_resources
    params[:content_resources].each_with_index do |resource_id, position|
      cr = ContentResource.find_by_content_id_and_resource_id(params[:content_id], resource_id)
      puts cr.position
      cr.content_id = params[:content_id]
      cr.resource_id = resource_id
      cr.position = position
      cr.save
      # ContentResource.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
  def import
    Content.find(params[:id]).send(params[:type] + "s") << params[:type].capitalize.constantize.find(params[:object_id])
  end
  
end
