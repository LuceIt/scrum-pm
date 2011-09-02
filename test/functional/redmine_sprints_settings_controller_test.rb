require File.join(File.dirname(__FILE__), '..', 'test_helper')
require 'redmine_sprints_settings_controller'

class RedmineSprintsSettingsController; def rescue_action(e) raise e end; end

class RedmineSprintsSettingsControllerTests < ActionController::TestCase
  fixtures :users, :user_stories_statuses, :user_stories
  
  def setup
    @controller = RedmineSprintsSettingsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    Setting.default_language = 'en'
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  test "should route redmine sprints plugin setting to a custom controller" do
    assert_routing(
      {:method => :get, :path=>'settings/plugin/redmine_sprints'},
      :controller => 'redmine_sprints_settings', :action => 'index')
  end

  test "should show redmine sprints settings page" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:user_stories_statuses)
  end

  test "should show not authorized message if user that is not admin try to enter in settings page" do
    @request.session[:user_id] = 2 # not admin
    get :show
    assert_response(403)
    assert_tag :tag => 'p', :attributes => {:id => 'errorExplanation'}, :content => /not authorized to access/
  end

  test "should redirect to login page if user has not logged in" do
    @request.session[:user_id] = nil
    get :show
    assert_redirected_to :controller => 'account', :action => 'login'
  end

  test "should show new user stories status page" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create a new status and redirect to index page" do
    assert_difference 'UserStoriesStatus.count' do
      post :create, :user_stories_status => { :name => 'user story status test', :position => 6, :is_default => false }
    end
    assert flash[:notice].match(/created successfully/)
    assert_redirected_to '/settings/plugin/redmine_sprints'
  end

  test "should show error if new status is not valid" do
    post :create, :user_stories_status => { :is_default => false} 
    assert_template 'new' 
  end

  test "should delete a status" do
    assert_difference 'UserStoriesStatus.count', -1 do
      post :destroy, :status_to_delete_id => 3
    end
    assert_template 'index'
  end

  test "should not delete the selected status if is in use by an user story" do
    post :destroy, :status_to_delete_id => 1
    assert flash[:error].match(/Error while deleting/)
  end

end
