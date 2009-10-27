# require 'rubygems'
# require 'dm-core'
# require 'dm-aggregates'
# require 'dm-timestamps'
# require 'dm-types'
# require 'dm-validations'

APP_ROOT = File.join(File.dirname(__FILE__), '..')
require File.join(APP_ROOT, 'vendor', 'gems', 'environment.rb')
Bundler.require_env(ENV['RACK_ENV'] || 'development')

DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.join(APP_ROOT, 'db', 'db.sqlite3'))}")
%w(extensions.rb helpers.rb models.rb).each { |f| require File.join(APP_ROOT, 'lib', f) }
