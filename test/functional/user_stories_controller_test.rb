require File.dirname(__FILE__) + '/../test_helper'

class UserStoriesControllerTest < ActionController::TestCase

  fixtures :projects, :user_stories

  def setup
    @controller = UserStoriesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @project = projects(:projects_001) 
  end  

  test "new user story should render modal panel with form for a new user story" do
    get :new
    assert :success
    assert_template 'user_stories/new'
  end
end
