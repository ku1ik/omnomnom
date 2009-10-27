task :env do
  require 'config/init'
end

namespace :db do
  desc "Autoupgrade db"
  task :autoupgrade  => :env do
    DataMapper.auto_upgrade!
  end
end
