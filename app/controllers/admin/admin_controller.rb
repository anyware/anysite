class Admin::AdminController < Admin::BaseAdminController
  layout "admin"
  
  def index
    @homepage = Folder.find_by_id(1)
    @resource_home = ResourceFolder.find_by_id(1)
  end
end
