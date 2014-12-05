require_relative './test_helper.rb'

class UserTest < MiniTest::Unit::TestCase
  def setup
    @root_org  = RootOrganization.new("Root")
    @org       = Organization.new("Org 1", @root_org)
    @user      = User.new("George Brett")
  end

  def test_a_user_role_knows_about_itself
    @user.add_user_role(self, @org, "user")

    assert "Org 1",        @user.roles[0].organization.name
    assert "George Brett", @user.roles[0].user.name
    assert :user,          @user.roles[0].role
  end
end
