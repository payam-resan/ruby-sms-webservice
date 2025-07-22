require 'net/http'
require 'uri'
require 'json'

def send_token_multi(template_key, destination, user_trace_id, parameters)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"

  recipient = {
    'Destination' => destination,
    'UserTraceId' => user_trace_id,
    'Parameters' => parameters
  }

  data = {
    'ApiKey' => api_key,
    'TemplateKey' => template_key,
    'Recipients' => [recipient]
  }

  uri = URI('http://api.sms-webservice.com/api/V3/SendTokenMulti')

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json

  response = http.request(request)
  response.body
end

# نمونه استفاده:
# puts send_token_multi("template123", "09123456789", "trace123", { "p1" => "val1", "p2" => "val2" })
