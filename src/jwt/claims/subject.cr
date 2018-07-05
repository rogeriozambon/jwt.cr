module JWT::Claims::Subject
  extend self

  def validate(payload : Hash, claims : Hash)
    raise Errors::Subject.new("Invalid subject.") unless claims["sub"] == payload["sub"]
  rescue KeyError
  end
end
