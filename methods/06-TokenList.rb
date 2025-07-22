require 'net/http'
require 'uri'
require 'json'

def token_list
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"
  
  data = { 'ApiKey' => api_key }
  uri = URI('http://api.sms-webservice.com/api/V3/TokenList')
  
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json
  
  response = http.request(request)
  response.body
end

# استفاده نمونه:
# puts token_list
