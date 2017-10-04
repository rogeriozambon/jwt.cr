require "./jwt/*"
require "./jwt/adapters/*"
require "./jwt/claims/*"
require "./jwt/engines/*"
require "./jwt/serializers/*"

module JWT
  def self.encode(payload, adapter)
    Engines::Encoder.new(payload, adapter).generate
  end

  def self.decode(token, adapter, claims : PayloadTypes = {} of String => String)
    Engines::Decoder.new(token, adapter).generate(claims)
  end
end
