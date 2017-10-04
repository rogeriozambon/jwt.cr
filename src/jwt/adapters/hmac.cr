require "openssl/hmac"

module JWT
  class Adapters::HS256
    def initialize(@key : String)
    end

    def sign(data)
      Serializer::B64.encode(OpenSSL::HMAC.digest(:sha256, @key, data))
    end

    def to_s
      "HS256"
    end
  end

  class Adapters::HS384
    def initialize(@key : String)
    end

    def sign(data)
      Serializer::B64.encode(OpenSSL::HMAC.digest(:sha384, @key, data))
    end

    def to_s
      "HS384"
    end
  end

  class Adapters::HS512
    def initialize(@key : String)
    end

    def sign(data)
      Serializer::B64.encode(OpenSSL::HMAC.digest(:sha512, @key, data))
    end

    def to_s
      "HS512"
    end
  end
end
