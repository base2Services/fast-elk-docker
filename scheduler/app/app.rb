require 'sinatra'
require 'json'
require 'rufus-scheduler'
require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'pstore'

set :bind, '0.0.0.0'
set :port, 4568

environment = ENV['ENVIRONMENT'] || 'no-env'

get '/api/hello/' do
  content_type :json
  { hello: 'scheduler', environment: environment}.to_json
end

scheduler = Rufus::Scheduler.new

scheduler.every '180s' do
  puts "alive"
end

scheduler.cron '00 09 * * *' do
  puts "it's 9am! good morning!"
end

scheduler.cron '01 00 * * *'do
  #command "/bin/bash /opt/es_backup.sh"
end

#don't need this as sinatra will keep this alive
#otherwise we need this to stay alive
#scheduler.join
