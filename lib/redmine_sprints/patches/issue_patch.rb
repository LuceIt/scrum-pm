module RedmineSprints
  module Patches
    module IssuePatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          belongs_to :user_story, :class_name => 'UserStory', :foreign_key => 'user_story_id'
        end
      end
      module ClassMethods
      end
      module InstanceMethods
      end
    end
  end
end
