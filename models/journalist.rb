require_relative "../config/environment.rb"
require 'active_support/inflector'
require_relative 'interactive_record.rb'

class Journalist < InteractiveRecord
  attr_accessor :name
  # attr_accessor(*self.public_attributes)
  attr_reader :id
end
