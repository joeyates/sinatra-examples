require 'partially_authenticated_app'

UNSAFE_PASSWORD = {
  'user' => 'password'
}

def admin_app
  app = Rack::Auth::Digest::MD5.new(AuthenticatedApp.new) do |username|
    UNSAFE_PASSWORD[username]
  end                         
  app.realm = 'Admin Area'
  app.opaque = 'this-should-be-secret'
  #app.passwords_hashed = false
  app
end

app = Rack::URLMap.new({
  '/'      => PublicApp.new,
  '/admin' => admin_app
})

run app

# rackup config.ru 
# http://localhost:9292
# User: user, password: password
