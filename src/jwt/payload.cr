module JWT::Payload
  extend self

  def generate(payload : Hash)
    Serializer::B64.encode(Serializer::JSON.encode(payload))
  end
end
