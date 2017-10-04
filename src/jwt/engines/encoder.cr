module JWT::Engines
	class Encoder
		def initialize(@payload : Hash(String, String), @adapter : JWT::Adapters::HS256 | JWT::Adapters::HS384 | JWT::Adapters::HS512)
		end

		def generate
			header = Header.new(@adapter.to_s)
			payload = Payload.new(@payload)
			signature = @adapter.sign("#{header.generate}.#{payload.generate}")

			"#{header.generate}.#{payload.generate}.#{signature}"
		end
	end
end
