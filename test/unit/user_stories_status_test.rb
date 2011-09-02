require File.join(File.dirname(__FILE__), "..", "test_helper")

require 'user_stories_status'

class UserStoriesStatusTest < ActiveSupport::TestCase

  fixtures :user_stories_statuses, :user_stories

  def test_user_stories_status_without_name_should_not_pass_validation
    user_stories_status = UserStoriesStatus.new
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:name].any?
  end

  def test_user_stories_status_without_position_should_not_pass_validation
    user_stories_status = UserStoriesStatus.new(:name => 'test')
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:position].any?
  end

  def test_user_stories_status_position_should_be_unique
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => 1)
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:position].any?
  end

  def test_user_stories_status_position_should_be_an_integer
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => '0.12')
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:position].any?
  end

  def test_user_stories_status_position_should_be_a_positive_integer
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => -1)
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:position].any?
  end
  
  def test_user_stories_status_should_have_only_one_default_status
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => 4, :is_default => true)
    assert_equal false, user_stories_status.valid?
    assert user_stories_status.errors[:is_default].any?
  end

  def test_user_stories_status_should_have_any_number_of_status_with_default_a_false
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => 4, :is_default => false)
    assert_equal true, user_stories_status.valid?
  end

  def test_user_stories_status_should_have_any_number_of_status_with_default_a_false
    user_stories_status = UserStoriesStatus.new(:name => 'test', :position => 4, :is_default => false)
    assert_equal true, user_stories_status.valid?
  end

  def test_user_stories_status_should_be_able_to_delete_an_unused_status
    assert UserStoriesStatus.destroy(3)
  end

  def test_user_stories_status_should_raise_error_if_try_to_delete_a_used_status
    assert_no_difference 'UserStoriesStatus.count' do
      UserStoriesStatus.destroy(1)
    end
  end

end
