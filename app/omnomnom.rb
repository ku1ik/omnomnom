require File.join(File.dirname(__FILE__), '..', 'config', 'init.rb')
# require 'sinatra'

# set :run, false
# set :app_file, __FILE__
# set :logging, true
# set :static, true
# set :root, APP_ROOT
# set :dump_errors, true

require File.join(APP_ROOT, 'config', 'environments', ENV['RACK_ENV'] || 'development')

helpers do
  include Omnomnom::Helpers
end

get '/' do
  'OHHAI'
end

Sinatra::Application.run! if __FILE__ == $0
