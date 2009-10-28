require File.join(File.dirname(__FILE__), '..', 'config', 'init.rb')

# set :run, false
set :logging, true
set :static, true
set :root, APP_ROOT
set :dump_errors, true
set :views, File.join(APP_ROOT, 'app', 'views')

require File.join(APP_ROOT, 'config', 'environments', ENV['RACK_ENV'] || 'development')

helpers do
  include Omnomnom::Helpers
end

before do
  @orders = Order.all(:created_at.gte => Date.today)
  @eatery = Eatery.new
end

get '/' do
  erb :home
end

post '/eateries' do
  @eatery = Eatery.new(params[:eatery])
  if @eatery.save
    redirect '/'
  else
    erb :home
  end
end

post '/orders' do
  @order = Order.new(params[:order])
  if @order.save
    redirect '/'
  else
    erb :home
  end
end

post '/items' do
  @item = OrderItem.new(params[:item])
    p @item
  if @item.save
    redirect '/'
  else
    erb :home
  end
end

Sinatra::Application.run! if __FILE__ == $0
