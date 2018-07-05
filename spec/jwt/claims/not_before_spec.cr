require "../../spec_helper"

describe JWT::Claims::NotBefore do
  it "throws an exception when it is invalid" do
    expect_raises(JWT::Errors::NotReady, /Token not ready/) do
      JWT::Claims::NotBefore.validate({"foo" => "bar", "nbf" => Time.now.epoch + 60})
    end
  end

  it "returns nil when it is valid" do
    JWT::Claims::NotBefore.validate({"foo" => "bar", "nbf" => Time.now.epoch - 60}).should be_nil
  end

  it "returns nil when there's no exists" do
    JWT::Claims::NotBefore.validate({"foo" => "bar"}).should be_nil
  end
end
