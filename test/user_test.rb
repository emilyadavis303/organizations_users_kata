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

  def test_a_user_knows_if_it_is_admin_for_a_specific_org
    @user.add_user_role(self, @root_org, "user")
    @user.add_user_role(self, @org, "admin")

    assert @user.is_admin_for_specific_org?(@org)
  end

  def test_a_user_knows_it_is_a_user_for_a_specific_org
    @user.add_user_role(self, @root_org, "user")
    @user.add_user_role(self, @org, "admin")

    assert @user.is_user_for_specific_org?(@root_org)
  end

  def test_a_user_knows_it_is_denied_for_a_specific_org
    @user.add_user_role(self, @org, "admin")
    @user.add_user_role(self, @child_org, "denied")

    assert @user.is_denied_for_specific_org?(@child_org)
  end
end
