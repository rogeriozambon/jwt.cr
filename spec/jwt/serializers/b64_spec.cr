require "../../spec_helper"

describe JWT::Serializer::B64 do
  it "encoding string" do
    JWT::Serializer::B64.encode("foo").should eq("Zm9v")
  end

  it "decoding string" do
    JWT::Serializer::B64.decode("Zm9v").should eq("foo")
  end
end
