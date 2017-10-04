require "../src/jwt"
require "secure_random"

adapter = JWT::Adapters::HS256.new("secret")
payload = {
  "aud" => ["guest", "visitor"],
  "exp" => Time.now.epoch + 120,
  "iss" => "jwt.cr",
  "sub" => "github",
  "user" => {
    "reference" => SecureRandom.uuid,
    "email" => "john@exmaple.org"
  }
}

token = JWT.encode(payload, adapter)

puts token
puts JWT.decode(token, adapter)
