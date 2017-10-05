module JWT::Claims
  class Audience
    def initialize(@payload : PayloadTypes, @claims : GenericTypes)
    end

    def validate
      if @payload.has_key?(key)
        audience = @payload[key].as(Array)

        raise Errors::Audience.new("Invalid audience.") unless audience.includes?(@claims[key])
      end
    rescue KeyError
    end

    def key
      "aud"
    end
  end
end
