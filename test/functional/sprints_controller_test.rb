require File.join(File.dirname(__FILE__), '..','test_helper')
require 'sprints_controller'

class SprintsController; def rescue_action(e) raise e end; end

class SprintsControllerTest < ActionController::TestCase

  fixtures :projects, :versions, :users, :roles, :members, :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses, :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries, :sprints, :user_stories, :user_stories_statuses

  def setup
    @controller = SprintsController.new
    @project = Project.find(1)
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    Setting.default_language = 'en'
    User.current = nil
  end
end
