gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/child_organization'

class ChildOrganizationTest < MiniTest::Unit::TestCase
  def test_a_child_organization_knows_about_itself
    # I also don't like this test, but I'm tired

    child = ChildOrganization.new("Child Org 1", Organization)

    assert_equal "Child Org 1", child.name
  end
end
