module JWT::Claims
  class Expiration
    property now : Int64

    def initialize(@payload : PayloadTypes)
      @now = Time.now.epoch
    end

    def validate
      raise Errors::Expired.new("Token has expired.") if @payload[key].to_s.to_i < @now
    rescue KeyError
    end

    def key
      "exp"
    end
  end
end
