require "logger"

module JWT
  class Logger
    class_property instance : ::Logger = ::Logger.new(STDOUT)
    @@instance.level = ::Logger::WARN
  end
end
