require_relative './test_helper.rb'

class UserTest < MiniTest::Unit::TestCase
  def setup
    @user      = User.new("George Brett")
    @root_org  = RootOrganization.new("Root")
    @org       = Organization.new("Org 1", @root_org)
    @child_org = ChildOrganization.new("Child Org 1", @org)
  end

  def test_a_user_knows_about_itself
    assert "George Brett", @user.name
  end

  def test_a_user_knows_if_it_is_an_admin
    @user.add_user_role(self, @root_org, "admin")
    assert @user.is_admin?
  end

  def test_a_user_knows_if_it_is_a_user
    @user.add_user_role(self, @root_org, "user")
    assert @user.is_user?
  end

  def test_a_user_knows_if_it_is_denied
    @user.add_user_role(self, @root_org, "denied")
    assert @user.is_denied?
  end
end
