class Admin::FolderController < Admin::BaseAdminController
  layout "folder_editor", :only => [:load_editor]
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @folder_pages, @folders = paginate :folders, :per_page => 10
  end

  def show
    @folder = Folder.find(params[:id])
  end
  
  def tree_node
    @folder = Folder.find(params[:id])
    render :update do |page|
      page.insert_html :bottom, 'folder_'+ @folder.id.to_s, :partial => 'tree_node', :locals => {:folder => @folder}
    end
  end

  def new
    @folder = Folder.new
  end

  def create
    parent = Folder.find_by_id(params[:target_id])
    @folder = parent.children.create(params[:folder])
    if parent && @folder.save
      flash[:notice] = 'Folder was successfully created.'
      render :update do |page|
        page.replace_html 'main_tab_content', :partial => 'edit'
        page.call 'refreshFolder', @folder.parent.id.to_s
      end
    else
      render :action => 'new'
    end
  end

  def _edit
    @folder = Folder.find(params[:id])
  end
  
  def editor
    if params[:id]
      @folder = Folder.find(params[:id])
    else
      @folder = Folder.new
    end
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update_attributes(params[:folder])
      flash[:notice] = 'Folder was successfully updated.'
      redirect_to :action => '_edit', :id => @folder
    else
      render :action => 'edit'
    end
  end

  def destroy
    Folder.find(params[:id]).destroy
    render :update do |page|
      page.remove "sub_folder_#{params[:id]}"
      page.remove "folder_#{params[:id]}"
    end
  end
  
  def update_positions
    params[:folder_folders_sortable_list].each_with_index do |id, position|
      Folder.update(id, :position => position+1)
    end
    render :nothing => true
  end
end
