require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  # INSTANCE METHODS

  def initialize(attributes = {})
    self.class.public_attributes.each do |attribute|
      self.send("#{attribute}=", attributes[attribute.to_sym])
    end
  end

  def save
    question_marks = self.class.public_attributes.map { |attribute| "?" }.join(", ")

    sql = <<-SQL
      INSERT INTO #{self.table_name_for_insert} (#{self.col_names_for_insert})
      VALUES (#{question_marks})
    SQL
    DB[:conn].execute(sql, *self.public_values)

    sql = "SELECT MAX(id) FROM #{self.table_name_for_insert}"
    @id = DB[:conn].execute(sql).first["MAX(id)"]
  end

  # INSTANCE HELPER METHOD

  def public_values
    self.class.public_attributes.map do |attribute|
      self.send(attribute.to_s)
    end
  end

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.class.public_attributes.join(", ")
  end

  def values_for_insert
    self.public_values.map { |value| "'#{value}'" }.join(", ")
  end

  # CLASS METHODS

  # def self.all
  #   sql = <<-SQL
  #     SELECT * FROM #{self.table_name};
  #   SQL
  #   rows = DB[:conn]execute(sql)
  #   rows.map do |row|
  #     self.object_from_row(row)
  #   end
  # end
  #
  # def object_from_row(row)
  #   object = self.new(title: row[1], page_count: row[2], genre: row[3], price: row[4])
  #   object.instance_variable_set("@id", row[0])
  #   object
  # end


  def self.all
    sql = <<-SQL
      SELECT * FROM #{self.table_name}
    SQL
    all = DB[:conn].execute(sql)
    array = []

    all.each do |element|
      element.each do |key, value|
        if key.is_a?(String)
          array << {key.to_sym => value}
        end
      end
    end

    self.new_from_database(array)

  end

  def self.new_from_database(row)
    obj = self.new(row)
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM #{self.table_name}
      WHERE name = ?
    SQL
    DB[:conn].execute(sql, name)
  end

  def self.find_by(attribute = {})
    sql = <<-SQL
      SELECT * FROM #{self.table_name}
      WHERE #{attribute.keys.first.to_s} = ?
    SQL
    DB[:conn].execute(sql, attribute.values.first)
  end

  # CLASS HELPER METHODS

  def self.column_names
    sql = "PRAGMA table_info (#{self.table_name})"
    DB[:conn].execute(sql).map { |element| element["name"] }
  end

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.public_attributes
    table_info = self.column_names
    table_info.delete("id")
    table_info
  end

end
