module JWT::Engines::Decoder
  extend self

  def generate(token : String, adapter : AdapterTypes, claims : Hash) : Tuple
    header, payload, signature = token.split(".")

    raise Errors::Verification.new("Signature is invalid.") unless signature == adapter.sign("#{header}.#{payload}")

    header = Serializer::JSON.decode(Serializer::B64.decode(header))
    payload = Serializer::JSON.decode(Serializer::B64.decode(payload))

    Claims::Audience.validate(payload, claims)
    Claims::Expiration.validate(payload.as_h)
    Claims::Issuer.validate(payload.as_h, claims)
    Claims::NotBefore.validate(payload.as_h)
    Claims::Subject.validate(payload.as_h, claims)

    {header, payload}
  rescue Base64::Error
    raise Errors::Decode.new("Invalid Base64.")
  rescue JSON::ParseException
    raise Errors::Decode.new("Invalid JSON.")
  end
end
