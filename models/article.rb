require_relative "../config/environment.rb"
require 'active_support/inflector'
require_relative 'interactive_record.rb'

class Article < InteractiveRecord
  attr_accessor :title, :body, :magazine_id, :journalist_id
  # attr_accessor(*self.public_attributes)
  attr_reader :id
end
