require_relative './test_helper.rb'

class OrganizationTest < MiniTest::Unit::TestCase
  def setup
    @root_org    = RootOrganization.new("Root")
    @org         = Organization.new("Org 1", @root_org)
  end

  def test_an_organization_knows_about_itself
    assert "Org 1", @org.name
  end

  def test_an_organization_knows_its_parent
    assert "Root", @org.parent
  end

  def test_an_organization_has_many_child_organizations
    @org.add_child_organization("Child Org 1")
    @org.add_child_organization("Child Org 2")

    assert_equal 2,       @org.children.length
    assert_equal "Org 1", @org.children[0].parent.name
  end
end
