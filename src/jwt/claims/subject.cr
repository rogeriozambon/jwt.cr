module JWT::Claims
  class Subject
    def initialize(@payload : PayloadTypes, @claims : GenericTypes)
    end

    def validate
      if @payload.has_key?(key)
        raise Errors::Subject.new("Invalid subject.") unless @claims[key] == @payload[key]
      end
    rescue KeyError
    end

    def key
      "sub"
    end
  end
end
