require 'socket'
require 'json'

socket = TCPServer.new(8085)

loop do
  client = socket.accept

  json_response = { :random => rand(1..100) }.to_json
  http_response = "HTTP/1.1 200\r\n\r\n#{ json_response }"
  client.puts(http_response)

  client.close
end