require "json"

module JWT::Serializer::JSON
  def self.encode(value)
    value.to_json
  end

  def self.decode(value)
    ::JSON.parse(value)
  end
end
