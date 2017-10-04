module JWT::Engines
	class Decoder
		def initialize(@token : String, @adapter : JWT::Adapters::HS256 | JWT::Adapters::HS384 | JWT::Adapters::HS512)
		end

		def generate
			header, payload, signature = @token.split(".")

	    if signature != @adapter.sign("#{header}.#{payload}")
	      raise Errors::Verification.new("Signature is invalid.")
	    end

	    {
				"header" => Serializer::JSON.decode(Serializer::B64.decode(header)).as_h,
				"payload" => Serializer::JSON.decode(Serializer::B64.decode(payload)).as_h
			}
		rescue Base64::Error
			raise Errors::Decode.new("Invalid Base64")
		rescue JSON::ParseException
			raise Errors::Decode.new("Invalid JSON")
		end
	end
end
