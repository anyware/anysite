class Admin::ResourcesController < InheritedResources::Base
  before_filter :authenticate_user!
end
