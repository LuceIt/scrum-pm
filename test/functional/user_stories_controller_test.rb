require File.join(File.dirname(__FILE__), '..', 'test_helper')

class UserStoriesControllerTest < ActionController::TestCase

  fixtures :projects, :versions, :users, :roles, :members, :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses, :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries, :sprints, :time_estimates, :user_stories, 
           :user_stories_statuses

  def setup
    @controller = UserStoriesController.new
    @project = Project.find(1)
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    Setting.default_language = 'en'
    User.current = nil
  end

  test 'should create a record with author and date when a user story change its status' do
      @request.session[:user_id] = 1
      Project.find(1).enabled_module_names = [:sprints]
      Role.find(1).add_permission! :manage_sprints_and_user_stories
      assert_difference 'UserStoriesAssignment.count' do
        post :update_user_story_status, :user_story_id => 1, :user_stories_status_id => 2
      end
  end

end
