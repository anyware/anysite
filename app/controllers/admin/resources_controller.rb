class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_user!
  
  def update_positions
  end
end
