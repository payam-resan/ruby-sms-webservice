require 'net/http'
require 'uri'
require 'json'

def send_bulk(destination, user_trace_id, text)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"
  sender = "30007546464646"

  # ساخت ساختار داده مطابق PHP
  recipients = [
    {
      "Destination" => destination,
      "UserTraceId" => user_trace_id
    }
  ]

  data = {
    "ApiKey" => api_key,
    "Text" => text,
    "Sender" => sender,
    "Recipients" => recipients
  }

  uri = URI("http://api.sms-webservice.com/api/V3/SendBulk")
  http = Net::HTTP.new(uri.host, uri.port)

  request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
  request.body = data.to_json

  response = http.request(request)
  response.body
end

# نمونه استفاده:
# puts send_bulk("09123456789", "trace123", "متن پیامک شما")
