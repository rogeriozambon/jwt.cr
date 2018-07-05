require "./jwt/*"
require "./jwt/adapters/*"
require "./jwt/claims/*"
require "./jwt/engines/*"
require "./jwt/serializers/*"

module JWT
  extend self

  def encode(payload, adapter)
    Engines::Encoder.generate(payload, adapter)
  end

  def decode(token, adapter, claims : Hash = {} of String => String)
    Engines::Decoder.generate(token, adapter, claims)
  end
end
