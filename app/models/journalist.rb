class Journalist
  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods
  attr_accessor(*self.public_attributes)
  attr_accessor :id
end
