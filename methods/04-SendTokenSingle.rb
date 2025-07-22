require 'net/http'
require 'uri'

def send_token_single(template_key, destination, param1, param2, param3)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"

  params = {
    'ApiKey' => api_key,
    'TemplateKey' => template_key,
    'Destination' => destination,
    'p1' => param1,
    'p2' => param2,
    'p3' => param3
  }

  uri = URI('http://api.sms-webservice.com/api/V3/SendTokenSingle')
  uri.query = URI.encode_www_form(params)

  response = Net::HTTP.get_response(uri)
  response.body
end

# نمونه استفاده
# puts send_token_single("template123", "09123456789", "value1", "value2", "value3")
