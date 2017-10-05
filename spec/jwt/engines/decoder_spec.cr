require "../../spec_helper"

describe JWT::Engines::Decoder do
  it "verifies token" do
    token = "eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJmb28iOiJiYXIifQ.ZXlKaGJHY2lPaUp1YjI1bElpd2lkSGx3SWpvaVNsZFVJbjAuZXlKbWIyOGlPaUppWVhJaWZR"
    header, payload = JWT::Engines::Decoder.new(token, adapters["none"]).generate({"foo" => "bar"})

    header.should eq({"alg" => "none", "typ" => "JWT"})
    payload.should eq({"foo" => "bar"})
  end
end
