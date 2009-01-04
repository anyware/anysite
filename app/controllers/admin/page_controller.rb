class Admin::PageController < Admin::BaseAdminController
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @page_pages, @pages = paginate :pages, :per_page => 10
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.folder = Folder.find_by_id(params[:target_id])
    if @page.folder && @page.save
      flash[:notice] = 'Page was successfully created.'
      redirect_to :action => 'edit', :id => @page
    else
      flash[:notice] = 'Problem creating the page'
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end
  
  def editor
    if params[:id]
      @page = Page.find(params[:id])
    else
      @page = Page.new
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
      render :partial => 'edit'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    render :update do |page|
      page.remove "folder_page_#{params[:id]}"
      page.remove "page_#{params[:id]}"
    end
  end
  
  def update_positions
    params[:folder_pages_sortable_list].each_with_index do |id, position|
      Page.update(id, :position => position+1)
    end
    render :nothing => true
  end
end
