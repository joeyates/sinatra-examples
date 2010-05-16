require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'

class MyApp < Sinatra::Base
  get '/upload' do
    haml :upload
  end

  post '/upload' do
    unless params[:file] &&
        (tmpfile = params[:file][:tempfile]) &&
        (name = params[:file][:filename])
      @error = "No file selected"
      return haml :upload
    end
    STDERR.puts "Uploading file, original name #{name.inspect}"
    while blk = tmpfile.read(65536)
      # here you would write it to its final location
      STDERR.puts blk.length
    end
    "Upload complete"
  end
end

