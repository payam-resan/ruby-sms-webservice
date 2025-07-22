require 'net/http'
require 'uri'
require 'json'

def account_info
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"

  data = {
    'ApiKey' => api_key
  }

  uri = URI('http://api.sms-webservice.com/api/V3/AccountInfo')
  http = Net::HTTP.new(uri.host, uri.port)

  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json

  response = http.request(request)
  response.body
end

# استفاده:
# puts account_info
