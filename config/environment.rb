require 'require_all'
require 'erb'
require 'sqlite3'
require 'pry'
require 'active_support/inflector'


# DATABASE CREATION
DB = {:conn => SQLite3::Database.new("publishing.db")}

# REQUIRE ALL FILES IN APP
require_rel '../app/'

# DATABASE SETUP
articles_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS articles (
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    magazine_id INTEGER,
    journalist_id INTEGER
  )
SQL

journalists_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS journalists (
  id INTEGER PRIMARY KEY,
  name TEXT
  )
SQL

magazines_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS magazines (
  id INTEGER PRIMARY KEY,
  name TEXT
  )
SQL

DB[:conn].execute("DROP TABLE IF EXISTS articles")
DB[:conn].execute(articles_sql)

DB[:conn].execute("DROP TABLE IF EXISTS journalists")
DB[:conn].execute(journalists_sql)

DB[:conn].execute("DROP TABLE IF EXISTS magazines")
DB[:conn].execute(magazines_sql)
