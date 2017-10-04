module JWT
  class Payload
    def initialize(@payload : PayloadTypes)
    end

    def generate
      Serializer::B64.encode(Serializer::JSON.encode(@payload))
    end
  end
end
