require "base64"

module JWT::Serializer::B64
  extend self

  def encode(value)
    Base64.urlsafe_encode(value).gsub(/\=+/, "")
  end

  def decode(value)
    Base64.decode_string(value)
  end
end
