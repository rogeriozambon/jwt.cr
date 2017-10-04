module JWT
  class Header
    def initialize(algorithm : String)
      @header = { "alg" => algorithm, "typ" => "JWT" }
    end

    def generate
      Serializer::B64.encode(Serializer::JSON.encode(@header))
    end
  end
end
