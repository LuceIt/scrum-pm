require File.dirname(__FILE__) + "/../test_helper"

class UserStoriesTest < Test::Unit::TestCase 

  def test_user_story_with_1_issue_and_1_hour_return_1_hour 
    user_story = UserStory.new
    user_story.stubs(:issues).returns([stub("issue", :spent_hours => 1)])
    assert_equal 1, user_story.total_assigned_hours 
  end

  def test_user_story_with_2_issues_and_1_hour_each_sum_2_hours
    user_story = UserStory.new
    user_story.stubs(:issues).returns([stub("issue1", :spent_hours =>1), stub("issue2", :spent_hours => 1)])
    assert_equal 2, user_story.total_assigned_hours
  end

  def test_user_story_wihtout_issues_should_return_0
    user_story = UserStory.new
    user_story.stubs(:issues).returns([])
    assert_equal 0, user_story.total_assigned_hours
  end

end
