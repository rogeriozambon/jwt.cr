module JWT::Header
  extend self

  def generate(adapter : AdapterTypes)
    Serializer::B64.encode(Serializer::JSON.encode({ "alg" => adapter.to_s, "typ" => "JWT" }))
  end
end
