require "../../spec_helper"

describe JWT::Adapters::None do
  it "returns an pure base64 encrypted value" do
    value = adapters["none"].sign("foo")
    value.should eq("Zm9v")
  end
end
