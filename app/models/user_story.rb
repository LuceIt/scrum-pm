class UserStory < ActiveRecord::Base
  unloadable
  belongs_to :project
  belongs_to :sprint, :class_name => 'Version', :foreign_key => 'version_id'
  belongs_to :time_estimate
  belongs_to :milestone
  belongs_to :user_stories_status, :foreign_key => 'user_stories_status_id'
  has_many :issues, :class_name => 'Issue', :foreign_key => 'user_story_id'
  has_many :diagrams


  def is_done?(date = nil)
    if date.blank?
      done_tasks = self.issues.find_all{|t| t.done_ratio == 100}.nitems
      done_tasks == self.issues.nitems && done_tasks != 0 ? true: false
    else
      ratio = 0
      current_issues = issues.find(:all, :conditions => ["created_on < ?", date])
      return false if issues.size != current_issues.size
      issues.each{|issue|
        done_ratio_details = issue.journals.map(&:details).flatten.select {|detail| 'done_ratio' == detail.prop_key }
        details_today_or_earlier = done_ratio_details.select {|a| a.journal.created_on.to_date <= date }
        last_done_ratio_change = details_today_or_earlier.sort_by {|a| a.journal.created_on }.last

        if last_done_ratio_change
          ratio += last_done_ratio_change.value.to_i
        elsif done_ratio_details.size == 0
          ratio += issue.done_ratio.to_i          
        end
      }
      return ratio / 100 == issues.size && issues.size > 0 ? true : false;
    end
  end

  def story_points
    time_estimate.value
  end

  def total_assigned_hours
    @total_assigned_hours ||= 0
    issues.each { |issue| 
      @total_assigned_hours += issue.spent_hours
    }
    @total_assigned_hours
  end

end
