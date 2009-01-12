class Admin::ResourceFolderController < Admin::BaseAdminController
  def new
    @resource_folder = ResourceFolder.new
  end
  
  def editor
    if params[:id]
      @resource_folder = ResourceFolder.find(params[:id])
    else
      @resource_folder = ResourceFolder.new
    end
  end
  
  def create
    parent = ResourceFolder.find_by_id(params[:target_id])
    @resource_folder = parent.children.create(params[:resource_folder])
    if parent && @resource_folder.save
      flash[:notice] = 'Resource Folder was successfully created.'
      #render :update do |page|
      #  page.replace_html 'main_tab_content', :partial => 'edit'
      #  page.replace_html 'resource_folder_'+ @resource_folder.parent.id.to_s+'_ul', :partial => 'tree_node', :locals => {:folder => @resource_folder.parent}
      #end
      render :update do |page|
        page.replace_html 'main_tab_content', :partial => 'edit'
        page.call 'refreshFolder', @resource_folder.parent.id.to_s
      end
    else
      render :action => 'new'
    end
  end

  def update
    @resource_folder = ResourceFolder.find(params[:id])
    if @resource_folder.update_attributes(params[:resource_folder])
      flash[:notice] = 'Resource Folder was successfully updated.'
      redirect_to :action => '_edit', :id => @resource_folder
    else
      render :action => 'edit'
    end
  end
  
  def _edit
    @resource_folder = ResourceFolder.find(params[:id])
  end
  
  def tree_node
    @resource_folder = ResourceFolder.find(params[:id])
    render :update do |page|
      page.insert_html :bottom, 'resource_folder_'+ @resource_folder.id.to_s, :partial => 'tree_node', :locals => {:folder => @resource_folder}
    end
  end
  
  def update_positions
    params[:resource_folder_folders_sortable_list].each_with_index do |id, position|
      ResourceFolder.update(id, :position => position+1)
    end
    render :nothing => true
  end
  
  def destroy
    ResourceFolder.find(params[:id]).destroy
    render :update do |page|
      page.remove "sub_resource_folder_#{params[:id]}"
      page.remove "resource_folder_#{params[:id]}"
    end
  end
  
end
