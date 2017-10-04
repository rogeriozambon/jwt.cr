module JWT::Engines
  class Decoder
    property header : String
    property payload : String
    property signature : String

    def initialize(token : String, @adapter : AdapterTypes)
      @header, @payload, @signature = token.split(".")
    end

    def generate(claims) : Tuple
      raise Errors::Verification.new("Signature is invalid.") unless isValid?

      validations(claims).map {|claim| claim.validate}

      {header, payload}
    rescue Base64::Error
      raise Errors::Decode.new("Invalid Base64.")
    rescue JSON::ParseException
      raise Errors::Decode.new("Invalid JSON.")
    end

    private def isValid?
      @signature == @adapter.sign("#{@header}.#{@payload}")
    end

    private def validations(claims)
      [
        Claims::Audience.new(payload, claims),
        Claims::Expiration.new(payload),
        Claims::Issuer.new(payload, claims),
        Claims::NotBefore.new(payload),
        Claims::Subject.new(payload, claims)
      ]
    end

    private def header
      Serializer::JSON.decode(Serializer::B64.decode(@header)).as_h
    end

    private def payload
      Serializer::JSON.decode(Serializer::B64.decode(@payload)).as_h
    end
  end
end
