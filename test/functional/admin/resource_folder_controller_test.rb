require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/resource_folder_controller'

# Re-raise errors caught by the controller.
class Admin::ResourceFolderController; def rescue_action(e) raise e end; end

class Admin::ResourceFolderControllerTest < Test::Unit::TestCase
  def setup
    @controller = Admin::ResourceFolderController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
