class UserStoriesAssignment < ActiveRecord::Base
  belongs_to :user_story
  belongs_to :user_stories_status
  belongs_to :user
end
