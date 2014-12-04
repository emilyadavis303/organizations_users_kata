require_relative 'organization'

class ChildOrganization
  attr_reader   :name, :parent

  def initialize(name, parent)
    @name     = name
    @parent   = parent
  end
end
