module JWT::Claims::Issuer
  extend self

  def validate(payload : Hash, claims : Hash)
    raise Errors::Issuer.new("Invalid issuer.") unless claims["iss"] == payload["iss"]
  rescue KeyError
  end
end
