require 'erb'
require 'sqlite3'
require 'pry'

DB = {:conn => SQLite3::Database.new("publishing.db")}
DB[:conn].execute("DROP TABLE IF EXISTS articles")
DB[:conn].execute("DROP TABLE IF EXISTS journalists")
DB[:conn].execute("DROP TABLE IF EXISTS magazines")

require_relative '../models/interactive_record'
require_relative '../models/article'
require_relative '../models/journalist'
require_relative '../models/magazine'
require_relative '../controllers/magazines_controller'
require_relative '../controllers/journalists_controller'
require_relative '../controllers/articles_controller'
require_relative '../views/magazines/new'
require_relative '../views/magazines/show'
require_relative '../views/journalists/new'
require_relative '../views/journalists/create'
require_relative '../views/journalists/show'
require_relative '../views/journalists/publish'

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

DB[:conn].execute(articles_sql)
DB[:conn].execute(journalists_sql)
DB[:conn].execute(magazines_sql)
DB[:conn].results_as_hash = true
