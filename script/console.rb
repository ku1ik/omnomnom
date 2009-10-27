require File.join(File.dirname(__FILE__), '..', 'config', 'init')
DataObjects::Sqlite3.logger = DataObjects::Logger.new(STDOUT, 0)
