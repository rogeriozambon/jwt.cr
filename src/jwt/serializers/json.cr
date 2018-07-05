require "json"

module JWT::Serializer::JSON
  extend self

  def encode(value)
    value.to_json
  end

  def decode(value)
    ::JSON.parse(value)
  end
end
