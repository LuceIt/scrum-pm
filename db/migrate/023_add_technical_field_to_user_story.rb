class AddTechnicalFieldToUserStory < ActiveRecord::Migration
  def self.up
    add_column :user_stories, :technical, :boolean, :default => false
  end

  def self.down
    remove_column :user_stories, :technical
  end
end
