require 'test_helper'

ActionController::Routing::Routes.draw {|map| map.resources :under_test }
class UnderTestController < ActionController::Base
  versioned_templates :index => :improved
  before_filter {|c| c.prepend_view_path(File.join(File.dirname(__FILE__), 'fixtures')) }
  def index; end
  def new; end
end

class VersionedTemplatesTest < ActionController::TestCase
  tests UnderTestController

  test "should render the new template" do
    get :new
    assert_template 'under_test/new'
  end
  
  test "should render a different template ofr index" do
    get :index
    assert_template 'under_test/improved'
  end
end
