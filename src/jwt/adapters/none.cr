module JWT
  class Adapters::None
    def sign(data)
      Serializer::B64.encode(data)
    end

    def to_s
      "none"
    end
  end
end
