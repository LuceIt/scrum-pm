require File.join(File.dirname(__FILE__), '..', 'test_helper')

class UserStoriesControllerTest < ActionController::TestCase

  fixtures :projects, :user_stories

  def setup
    @controller = UserStoriesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @project = projects(:projects_001) 
  end  

end
