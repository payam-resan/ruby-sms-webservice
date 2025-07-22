require 'net/http'
require 'uri'
require 'json'

def send_multiple(destination, user_trace_id, text)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"
  sender = "30007546464646"

  recipients = [
    {
      "Sender" => sender,
      "Text" => text,
      "Destination" => destination,
      "UserTraceId" => user_trace_id
    }
  ]

  data = {
    "ApiKey" => api_key,
    "Recipients" => recipients
  }

  uri = URI("http://api.sms-webservice.com/api/V3/SendMultiple")
  http = Net::HTTP.new(uri.host, uri.port)

  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json

  response = http.request(request)
  response.body
end

# نمونه استفاده:
# puts send_multiple("09123456789", "trace123", "متن پیام شما")
