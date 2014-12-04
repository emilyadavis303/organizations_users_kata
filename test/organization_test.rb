gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/organization'

class OrganizationTest < MiniTest::Unit::TestCase
  def test_an_organization_knows_its_parent
    # I do not like this test
    org = Organization.new("Organization 1", RootOrganization, "Child Organization 1")

    assert "Root", org.parent
  end

  def test_an_organization_has_many_child_organizations
    org = Organization.new("Organization 1", RootOrganization, "Child Organization 1")
    co1 = org.add_child_organization("Org 1")
    co2 = org.add_child_organization("Org 2")

    assert_equal 2,       org.children.length
    assert_equal "Organization 1", org.children[0].parent.name
  end
end
