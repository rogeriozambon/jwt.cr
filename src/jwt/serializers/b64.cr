require "base64"

module JWT::Serializer::B64
	def self.encode(value)
		Base64.urlsafe_encode(value).gsub(/\=+/, "")
	end

	def self.decode(value)
		Base64.decode_string(value)
	end
end
