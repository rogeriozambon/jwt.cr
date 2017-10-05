require "../../spec_helper"

describe JWT::Engines::Encoder do
  it "returns valid token" do
    token = JWT::Engines::Encoder.new({"foo" => "bar"}, adapters["none"]).generate
    token.should eq("eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJmb28iOiJiYXIifQ.ZXlKaGJHY2lPaUp1YjI1bElpd2lkSGx3SWpvaVNsZFVJbjAuZXlKbWIyOGlPaUppWVhJaWZR")
  end
end
