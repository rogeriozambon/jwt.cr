require "openssl/hmac"

module JWT
	class Adapters::HS256
		def initialize(@key : String)
		end

		def sign(data)
			signed = OpenSSL::HMAC.digest(:sha256, @key, data)
			Serializer::B64.encode(signed)
		end

		def to_s
			"HS256"
		end
	end

	class Adapters::HS384
		def initialize(@key : String)
		end

		def sign(data)
			signed = OpenSSL::HMAC.digest(:sha384, @key, data)
			Serializer::B64.encode(signed)
		end

		def to_s
			"HS384"
		end
	end

	class Adapters::HS512
		def initialize(@key : String)
		end

		def sign(data)
			signed = OpenSSL::HMAC.digest(:sha512, @key, data)
			Serializer::B64.encode(signed)
		end

		def to_s
			"HS512"
		end
	end
end
