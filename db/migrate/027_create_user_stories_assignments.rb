class CreateUserStoriesAssignments < ActiveRecord::Migration

  def self.up
    create_table :user_stories_assignments do |field|
      field.references :user_story
      field.references :user_stories_status
      field.references :user
      field.datetime :update_date
    end
  end

  def self.down
    drop_table :user_stories_assignments
  end
end
