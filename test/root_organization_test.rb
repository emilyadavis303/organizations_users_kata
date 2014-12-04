require_relative './test_helper.rb'

class RootOrganizationTest < MiniTest::Unit::TestCase
  def setup
    @root_org = RootOrganization.new("The Root Organization")
  end

  def test_a_root_organization_knows_about_itself
    assert "The Root Organization", @root_org.name
  end

  def test_a_root_organization_has_many_organizations
    @root_org.add_organization("Org 1")
    @root_org.add_organization("Org 2")

    assert_equal 2,                        @root_org.children.length
    assert_equal "The Root Organization",  @root_org.children[0].parent.name
    assert_equal "Org 2",                  @root_org.children[1].name
  end
end
