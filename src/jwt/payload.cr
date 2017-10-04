module JWT
	class Payload
		def initialize(@data : Hash(String, String))
		end

		def generate
			data = Serializer::JSON.encode(@data)
			Serializer::B64.encode(data)
		end
	end
end
