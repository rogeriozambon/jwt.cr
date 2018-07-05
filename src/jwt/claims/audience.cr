module JWT::Claims::Audience
  extend self

  def validate(payload : JSON::Any, claims : Hash)
    raise Errors::Audience.new("Invalid audience.") unless payload["aud"].as_a.includes?(claims["aud"])
  rescue KeyError
  end
end
