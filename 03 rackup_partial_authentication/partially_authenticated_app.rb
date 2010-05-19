require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'

class PublicApp < Sinatra::Base
  get '/' do
    "Hello public user"
  end
end

class AuthenticatedApp < Sinatra::Base
  # Accept '/admin' with or without final '/'
  get '/?' do
    "Hello authenticated user '#{ env['REMOTE_USER'] }'"
  end
end
