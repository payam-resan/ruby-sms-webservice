require 'net/http'
require 'uri'
require 'json'

def status_by_user_trace_id(user_trace_ids)
  api_key = "e883424d-d70f-4e58-8ee3-4e21ea390ff1"

  data = {
    'ApiKey' => api_key,
    'UserTraceIds' => user_trace_ids
  }

  uri = URI('http://api.sms-webservice.com/api/V3/StatusByUserTraceId')
  http = Net::HTTP.new(uri.host, uri.port)

  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json

  response = http.request(request)
  response.body
end

# مثال استفاده:
# puts status_by_user_trace_id(["trace_id_1", "trace_id_2"])
