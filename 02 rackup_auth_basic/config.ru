require 'my_app'

UNSAFE_PASSWORD = {
  'user' => 'hello'
}

use Rack::Auth::Basic, 'Rackup Basic Auth' do |username, password|
  return false if password.nil?
  UNSAFE_PASSWORD[username] == password
end

run MyApp.new

# rackup config.ru --port=4567
# http://localhost:4567
# User: user, password: hello
