class CreateUserStoriesStatuses < ActiveRecord::Migration
  def self.up
    create_table :user_stories_statuses do |field|
      field.string :name
      field.integer :position
      field.boolean :is_default
      field.timestamps
    end
  end

  def self.down
    drop_table :user_stories_statuses
  end
end
