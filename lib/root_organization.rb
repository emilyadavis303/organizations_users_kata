require_relative 'organization'

class RootOrganization
  attr_reader   :name
  attr_accessor :children

  def initialize(name, children=nil)
    @name     = name
    @children = [ ]
  end

  def add_organization(name)
    @children << Organization.new(name, parent=self)
  end
end
