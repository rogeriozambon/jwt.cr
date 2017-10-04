module JWT
  alias AdapterTypes = Adapters::None | Adapters::HS256 | Adapters::HS384 | Adapters::HS512
  alias GenericTypes = Hash(String, JSON::Type) | Hash(String, String)
  alias SpecificTypes = Hash(String, Hash(String, String) | Int64 | String) | Hash(String, Array(String) | Hash(String, String) | Int64 | String)
  alias PayloadTypes = Hash(String, Array(String) | String) | Hash(String, Int64 | String) | Hash(String, Array(String) | Int64 | String) | SpecificTypes | GenericTypes
end
