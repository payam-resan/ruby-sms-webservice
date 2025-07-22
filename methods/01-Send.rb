require 'net/http'
require 'uri'

def send_sms(recipients, text)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"
  sender = "30007546464646"

  params = {
    'ApiKey' => api_key,
    'Text' => URI.encode_www_form_component(text),
    'Sender' => sender,
    'Recipients' => recipients
  }

  base_url = "http://api.sms-webservice.com/api/V3/Send"
  uri = URI(base_url)
  uri.query = URI.encode_www_form(params)

  response = Net::HTTP.get_response(uri)
  response.body
end

# استفاده:
# puts send_sms("09123456789", "متن پیامک")
