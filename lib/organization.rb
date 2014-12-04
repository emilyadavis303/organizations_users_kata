require_relative 'root_organization'
require_relative 'child_organization'

class Organization
  attr_reader   :name
  attr_accessor :parent, :children

  def initialize(name, parent, children=nil)
    @name     = name
    @parent   = parent
    @children = [ ]
  end

  def add_child_organization(name)
    @children << ChildOrganization.new(name, parent=self)
  end
end
