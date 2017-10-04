require "spec"
require "../src/jwt"

def adapters
  {
    "none" => JWT::Adapters::None.new,
    "hs256" => JWT::Adapters::HS256.new("secret"),
    "hs384" => JWT::Adapters::HS384.new("secret"),
    "hs512" => JWT::Adapters::HS512.new("secret")
  }
end
