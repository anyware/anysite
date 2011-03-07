class Admin::FoldersController < InheritedResources::Base
  before_filter :authenticate_user!
end
