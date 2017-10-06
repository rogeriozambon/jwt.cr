require "spec"
require "../src/jwt"

JWT::Logger.instance = Logger.new(IO::Memory.new)

def context_for_tests
  HTTP::Server::Context.new(
    HTTP::Request.new("GET", "/", HTTP::Headers.new),
    HTTP::Server::Response.new(IO::Memory.new)
  )
end

def adapters
  {
    "none" => JWT::Adapters::None.new,
    "hs256" => JWT::Adapters::HS256.new("secret"),
    "hs384" => JWT::Adapters::HS384.new("secret"),
    "hs512" => JWT::Adapters::HS512.new("secret")
  }
end
