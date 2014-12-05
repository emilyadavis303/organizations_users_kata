require_relative 'user'

class UserRole
  attr_accessor :user, :organization, :role

  ROLES = [:admin, :user, :denied]

  def initialize(user, organization, role)
    @user         = user
    @organization = organization
    @role         = role.downcase.to_sym
  end
end
