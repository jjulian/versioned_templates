require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'action_controller/test_process'
require 'action_view/test_case'
require 'versioned_templates'
ActionController::Base.send(:include, VersionedTemplates)
