require "./jwt/*"
require "./jwt/adapters/*"
require "./jwt/engines/*"
require "./jwt/serializers/*"

module JWT
	def self.encode(payload, adapter)
		Engines::Encoder.new(payload, adapter).generate
	end

	def self.decode(token, adapter)
		Engines::Decoder.new(token, adapter).generate
  end
end
