module JWT::Claims::NotBefore
  extend self

  def validate(payload : Hash)
    raise Errors::NotReady.new("Token not ready.") if payload["nbf"].to_s.to_i > Time.now.epoch
  rescue KeyError
  end
end
