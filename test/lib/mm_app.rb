require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'mongo_mapper'
require File.join(File.dirname(__FILE__), '../../lib/sinatra-authentication')


MongoMapper.database = 'sinatratest'

class TestApp < Sinatra::Base
  use Rack::Session::Cookie, :secret => "heyhihello"

  register Sinatra::LilAuthentication 

  set :environment, 'development'
  set :public, 'public'
  set :views,  'views'

  get '/' do
    haml "= render_login_logout", :layout => :layout
  end
end
