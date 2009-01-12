class Admin::ResourceController < Admin::BaseAdminController
  def new
    @resource = Resource.new
  end
  
  def editor
    if params[:id]
      @resource = Resource.find(params[:id])
    else
      @resource = Resource.new
    end
  end
  
  def create
    @resource = Resource.new(params[:resource])
    @resource.resource_folder = ResourceFolder.find_by_id(params[:target_id])
    responds_to_parent do
      render :update do |page|
        if @resource.resource_folder && @resource.save
          page.replace_html 'main_tab_content', :partial => 'edit', :object => @resource
          page.call 'unloading'
          page.call 'tree.refreshResourceFolder', @resource.resource_folder.id
        else
          page.alert('error')
        end
      end
    end
  end
  
  def _edit
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    responds_to_parent do
      render :update do |page|
        if @resource.update_attributes(params[:resource])
          page.replace_html 'main_tab_content', :partial => 'edit', :object => @resource
          page.call 'unloading'
          page.call 'tree.refreshResourceFolder', @resource.resource_folder.id
        else
          page.alert('error')
        end
      end
    end
  end
  
  def upload
    @uploaded = Resource.new(params[:resource])
    @resource = Resource.find(params[:id])
    @resource.update_attributes(params[:resource])
  end
  
  def update_positions
    params[:resource_folder_resources_sortable_list].each_with_index do |id, position|
      Resource.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
  def destroy
    Resource.find(params[:id]).destroy
    render :update do |page|
      page.remove "resource_folder_resource_#{params[:id]}"
      page.remove "resource_#{params[:id]}"
    end
  end
  
end
