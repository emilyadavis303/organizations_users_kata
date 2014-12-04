require_relative './test_helper.rb'

class ChildOrganizationTest < MiniTest::Unit::TestCase
  def setup
    @root_org  = RootOrganization.new("Root")
    @org       = Organization.new("Org 1", @root_org)
    @child_org = ChildOrganization.new("Child Org 1", @org)
  end

  def test_a_child_organization_knows_about_itself
    assert_equal "Child Org 1", @child_org.name
  end

  def test_a_child_organization_knows_about_its_family
    assert_equal "Org 1",       @child_org.parent.name
    assert_equal "Root",        @child_org.parent.parent.name
  end
end
