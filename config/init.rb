APP_ROOT = File.join(File.dirname(__FILE__), '..')

# load needed gems
require File.join(APP_ROOT, 'vendor', 'gems', 'environment.rb')
Bundler.require_env(ENV['RACK_ENV'] || 'development')

# connect to db
DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.join(APP_ROOT, 'db', 'db.sqlite3'))}")

# load lib/*
%w(extensions.rb helpers.rb models.rb).each { |f| require File.join(APP_ROOT, 'lib', f) }