class AddBlackboardFieldToUserStory < ActiveRecord::Migration
  def self.up
    add_column :user_stories, :blackboard, :boolean
  end

  def self.down
    remove_column :user_stories, :blackboard
  end
end
