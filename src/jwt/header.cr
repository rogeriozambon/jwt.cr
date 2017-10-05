module JWT
  class Header
    def initialize(adapter : AdapterTypes)
      @header = { "alg" => adapter.to_s, "typ" => "JWT" }
    end

    def generate
      Serializer::B64.encode(Serializer::JSON.encode(@header))
    end
  end
end
