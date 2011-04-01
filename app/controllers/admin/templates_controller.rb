class Admin::TemplatesController < ApplicationController
  before_filter :authenticate_user!

end
