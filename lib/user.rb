require_relative 'user_role'

class User
  attr_reader   :name
  attr_accessor :roles

  def initialize(name, roles=nil)
    @roles = [ ]
  end

  def add_user_role(user, organization, role)
    @roles << UserRole.new(self, organization, role)
  end

  def collect_user_roles
    roles.collect { |r| r }
  end

  def is_admin?
    roles = self.collect_user_roles
    roles.any? { |r| r.role == :admin }
  end

  def is_user?
    roles = self.collect_user_roles
    roles.any? { |r| r.role == :user }
  end

  def is_denied?
    roles = self.collect_user_roles
    roles.any? { |r| r.role == :denied }
  end
end
