module JWT::Claims
  class NotBefore
    property now : Int64

    def initialize(@payload : PayloadTypes)
      @now = Time.now.epoch
    end

    def validate
      raise Errors::NotReady.new("Token not ready.") if @payload[key].to_s.to_i > @now
    rescue KeyError
    end

    def key
      "nbf"
    end
  end
end
