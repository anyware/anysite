class Admin::ContentsController < InheritedResources::Base
  before_filter :authenticate_user!
end
