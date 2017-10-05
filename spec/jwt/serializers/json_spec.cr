require "../../spec_helper"

describe JWT::Serializer::JSON do
  it "encoding string" do
    JWT::Serializer::JSON.encode({"foo" => "bar"}).should eq("{\"foo\":\"bar\"}")
  end

  it "decoding string" do
    JWT::Serializer::JSON.decode("{\"foo\":\"bar\"}").should eq({"foo" => "bar"})
  end
end
