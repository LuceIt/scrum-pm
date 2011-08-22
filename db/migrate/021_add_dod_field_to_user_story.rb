class AddDodFieldToUserStory < ActiveRecord::Migration
  def self.up
    add_column :user_stories, :dod, :text
  end

  def self.down
    remove_column :user_stories, :dod
  end
end
