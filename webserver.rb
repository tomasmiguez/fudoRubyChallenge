require 'socket'
require 'json'

socket = TCPServer.new(8085)

loop do
  client = socket.accept
  
  client.gets
  
  http_response = "HTTP/1.1 200\r\n\r\n#{ { :random => rand(1..100) }.to_json }"
  client.puts(http_response)

  client.close
end
