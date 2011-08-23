class AddBugAndBugInnerFieldsToUserStory < ActiveRecord::Migration
  def self.up
    add_column :user_stories, :bug, :boolean, :default => false
    add_column :user_stories, :bug_internal, :boolean, :default => true
  end

  def self.down
    remove_column :user_stories, :bug
    remove_column :user_stories, :bug_inner
  end
end
