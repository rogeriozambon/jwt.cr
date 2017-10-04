require "../src/jwt"

adapter = JWT::Adapters::None.new
token = JWT.encode({"foo" => "bar"}, adapter)

puts token
puts JWT.decode(token, adapter)
