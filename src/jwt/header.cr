module JWT
	class Header
		def initialize(@algorithm : String)
		end

		def generate
			data = Serializer::JSON.encode({ "typ" => "JWT", "alg" => @algorithm })
			Serializer::B64.encode(data)
		end
	end
end
