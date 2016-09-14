require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

environment = ENV['ENVIRONMENT'] || 'no-env'

get '/api/hello/' do
  content_type :json
  { hello: 'world', environment: environment}.to_json
end

get '/*' do
  "Hello World #{params['name']} - @environmet: #{environment}".strip
end
