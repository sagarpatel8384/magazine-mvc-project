module Databaseable

  # CLASS METHODS

  module ClassMethods

    def public_attributes
      sql = <<-SQL
        PRAGMA table_info(#{self.table_name})
      SQL
      info = DB[:conn].execute(sql)
      attributes = info.map { |arr| arr[1].to_sym }
      attributes.reject { |attribute| attribute == :id }
      # [:name, :title, :body]
    end

    def all
      sql = <<-SQL
        SELECT * FROM #{self.table_name}
      SQL
      rows = DB[:conn].execute(sql)
      rows.map do |row|
        self.objects_from_row(row)
      end
    end

    def find(id)
      sql = <<-SQL
        SELECT * FROM #{self.table_name}
        WHERE id = ?
      SQL
      result = DB[:conn].execute(sql, id).first
      self.objects_from_row(result) if !result.nil?
    end

    def find_by(attribute = {})
      search_value = "#{attribute.values.first}"

      sql = <<-SQL
        SELECT * FROM #{self.table_name}
        WHERE #{attribute.keys.first.to_s} = ?
      SQL

      result = DB[:conn].execute(sql, search_value).first
      self.objects_from_row(result) if !result.nil?
    end

    def objects_from_row(row)
      id = row.shift
      counter = 0
      attributes = self.public_attributes.each_with_object({}) do |item, hash|
        hash[item] = row[counter]
        counter += 1
      end
      self.new(attributes, id)
    end

    def table_name
      self.to_s.downcase.pluralize
    end

  end

  # INSTANCE METHODS

  module InstanceMethods

    def initialize(attributes = {}, id = nil)
      self.class.public_attributes.each do |attribute|
        self.send("#{attribute.to_s}=", attributes[attribute])
      end
      @id = id
    end

    def save
      question_marks = ("?" * self.class.public_attributes.length).split("").join(", ")

      sql = <<-SQL
        INSERT INTO #{self.insert_table} (#{self.columns_to_insert})
        VALUES (#{question_marks})
      SQL

      DB[:conn].execute(sql, *values_to_insert)
      @id = DB[:conn].execute("SELECT MAX(id) FROM #{self.insert_table}").flatten.first
    end

    def update
      question_marks = self.class.public_attributes.map do |attribute|
        "#{attribute} = ?"
      end.join(", ")

      sql = <<-SQL
        UPDATE #{self.insert_table}
        SET #{question_marks}
        WHERE id = ?
      SQL

      result = DB[:conn].execute(sql, *self.values_to_insert, self.id)
    end

    def insert_table
      self.class.table_name
    end

    def columns_to_insert
      # [:name, :title, :body] => # "name, title, body"
      self.class.public_attributes.map { |element| element.to_s }.join(", ")
    end

    def values_to_insert
      # [:name, :title, :body]
      # [self.name, self.title, self.body]
      self.class.public_attributes.map do |attribute|
        self.send("#{attribute.to_s}")
      end
    end

  end

end
