require_relative './test_helper.rb'

class UserTest < MiniTest::Unit::TestCase
  def test_a_user_role_can_find_a_specific_users_role
    skip
    @user = User.new("George Brett")
    @org       = Organization.new("Org 1", @root_org)
    user.add_user_role(@user, @org, :admin)

    user
  end
end
