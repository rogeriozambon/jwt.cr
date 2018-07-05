module JWT::Claims::Expiration
  extend self

  def validate(payload : Hash)
    raise Errors::Expired.new("Token has expired.") if payload["exp"].to_s.to_i < Time.now.epoch
  rescue KeyError
  end
end
