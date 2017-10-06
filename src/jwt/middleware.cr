require "http/server"

module JWT
  class Middleware
    include HTTP::Handler

    def initialize(@adapter : AdapterTypes)
    end

    def call(context)
      return call_next(context) if context.request.method == "OPTIONS"

      auth = context.request.headers["Authorization"]
      return forbidden(context) if auth.empty?

      auth_parts = auth.split(" ")
      return forbidden(context) if auth_parts.size != 2 || auth_parts.first.downcase != "bearer" || auth_parts.last.split(".").size != 3

      token = auth_parts.last
      JWT.decode(token, @adapter)

      call_next(context)
    rescue KeyError
      Logger.instance.error("Authorization header not found.")
      forbidden(context)
    rescue exception : JWT::Errors::Decode | JWT::Errors::Verification | JWT::Errors::Expired | JWT::Errors::NotReady
      Logger.instance.error("#{token} - #{exception.message} (#{exception.class})")
      forbidden(context)
    end

    private def forbidden(context)
      context.response.headers["Content-Type"] = "text/plain"
      context.response.headers["Content-Length"] = "0"
      context.response.status_code = 403
      context.response.close
    end
  end
end
