require 'sinatra/base'
require 'net/http'

class Application < Sinatra::Base
  get "/cpu" do
    a = 1
    10_000_000.times do
      a+= 1
    end
    a.to_s
  end


  get "/io" do
    body = ""
    Net::HTTP.start('www.google.com.hk', 80) do |http|
      response = http.get('/')
      body = response.body
    end
    body.to_s
  end
end
