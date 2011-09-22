module RedmineSprints
  module Patches
    module VersionPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          has_many :user_stories, :class_name => 'UserStory', :foreign_key => 'version_id'
          validates_presence_of :effective_date
        end
      end
      module ClassMethods
      end
      module InstanceMethods
      end
    end
  end
end
