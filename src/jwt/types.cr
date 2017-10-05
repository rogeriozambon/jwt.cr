module JWT
  alias AdapterTypes = Adapters::None | Adapters::HS256 | Adapters::HS384 | Adapters::HS512

  alias StringType = Hash(String, String)
  alias IntStringType = Int64 | String
  alias StringIntType = StringType | IntStringType

  alias GenericTypes = StringType | Hash(String, JSON::Type) | Hash(String, Int64) | Hash(String, StringType)
  alias SpecificTypes = Hash(String, StringIntType) | Hash(String, Array(String) | StringType | String) | Hash(String, Array(String) | StringIntType)

  alias PayloadTypes = Hash(String, Array(String) | String) | Hash(String, IntStringType) | Hash(String, Array(String) | IntStringType) | SpecificTypes | GenericTypes
end
