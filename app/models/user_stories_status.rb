class UserStoriesStatus < ActiveRecord::Base
  unloadable
  before_destroy :check_integrity
  has_many :user_story
  acts_as_list

  validates_presence_of :name, :position
  validates_uniqueness_of :position
  validates_numericality_of :position, :only_integer => true, :greater_than => 0
  validates_uniqueness_of :is_default, :if => :default_need_uniqueness?

  named_scope :named, lambda {|arg| { :conditions => ["LOWER(#{table_name}.name) = LOWER(?)", arg.to_s.strip]}}

  def default_need_uniqueness?
    !self.is_default.blank? and self.is_default and UserStoriesStatus.find(:all, :conditions => ["is_default = true"])
  end

  def <=>(status)
    position <=> status.position
  end

  def to_s; name end

  private

  def check_integrity
    UserStory.find(:all, :conditions => ["user_stories_status_id = " + self.id.to_s ]).blank?
  end
end
