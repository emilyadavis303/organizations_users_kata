require_relative './test_helper.rb'

class UserTest < MiniTest::Unit::TestCase
  def test_a_user_knows_about_itself
    user = User.new("George Brett")

    assert "George Brett", user.name
  end
end
