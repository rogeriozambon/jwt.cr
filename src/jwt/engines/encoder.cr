module JWT::Engines
  class Encoder
    def initialize(@payload : PayloadTypes, @adapter : AdapterTypes)
    end

    def generate
      header = Header.new(@adapter)
      payload = Payload.new(@payload)
      signature = @adapter.sign("#{header.generate}.#{payload.generate}")

      "#{header.generate}.#{payload.generate}.#{signature}"
    end
  end
end
