require 'erb'
require 'sqlite3'
require 'pry'
require 'active_support/inflector'

# DATABASE CREATION
DB = {:conn => SQLite3::Database.new("publishing.db")}

# CONCERNS
require_relative '../app/concerns/databaseable'

# MODELS
require_relative '../app/models/article'
require_relative '../app/models/journalist'
require_relative '../app/models/magazine'

# CONTROLLERS
require_relative '../app/controllers/magazines_controller'
require_relative '../app/controllers/journalists_controller'
require_relative '../app/controllers/articles_controller'

# VIEWS
require_relative '../app/views/magazines/new'
require_relative '../app/views/magazines/show'
require_relative '../app/views/journalists/new'
require_relative '../app/views/journalists/create'
require_relative '../app/views/journalists/show'
require_relative '../app/views/journalists/publish'
require_relative '../app/views/articles/new'


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
