module JWT::Claims
  class Audience
    def initialize(@payload : PayloadTypes, @claims : GenericTypes)
    end

    def validate
      if @payload.has_key?(key)
        raise Errors::Audience.new("Invalid audience.") unless @claims[key] == @payload[key]
      end
    rescue KeyError
    end

    def key
      "aud"
    end
  end
end
