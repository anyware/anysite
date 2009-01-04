class Site::FolderController < ApplicationController
  layout "site"
  
  def index    
    @folder = Folder.find_by_id(1)
  end
end
