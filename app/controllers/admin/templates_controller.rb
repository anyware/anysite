class Admin::TemplatesController < InheritedResources::Base
  before_filter :authenticate_user!

end
