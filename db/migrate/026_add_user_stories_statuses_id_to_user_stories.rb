class AddUserStoriesStatusesIdToUserStories < ActiveRecord::Migration

  def self.up
    add_column :user_stories, :user_stories_status_id, :integer
  end

  def self.down
    remove_column :user_stories, :user_stories_status_id 
  end
end
