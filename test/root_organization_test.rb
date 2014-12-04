gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/root_organization'

class RootOrganizationTest < MiniTest::Unit::TestCase
  def test_a_root_organization_knows_about_itself
    root = RootOrganization.new("The Root Organization")

    assert "The Root Organization", root.name
  end

  def test_a_root_organization_has_many_organizations
    root = RootOrganization.new("Root")
    co1 = root.add_organization("Org 1")
    co2 = root.add_organization("Org 2")

    assert_equal 2,       root.children.length
    assert_equal "Root",  root.children[0].parent.name
    assert_equal "Org 2", root.children[1].name
  end
end
