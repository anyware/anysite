require File.dirname(__FILE__) + '/../../test_helper'
require 'site/folder_controller'

# Re-raise errors caught by the controller.
class Site::FolderController; def rescue_action(e) raise e end; end

class Site::FolderControllerTest < Test::Unit::TestCase
  def setup
    @controller = Site::FolderController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
