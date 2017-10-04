module JWT::Claims
  class Issuer
    def initialize(@payload : PayloadTypes, @claims : GenericTypes)
    end

    def validate
      if @payload.has_key?(key)
        raise Errors::Issuer.new("Invalid issuer.") unless @claims[key] == @payload[key]
      end
    rescue KeyError
    end

    def key
      "iss"
    end
  end
end
