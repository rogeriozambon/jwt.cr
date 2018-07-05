require "../../spec_helper"

describe JWT::Claims::Expiration do
  it "throws an exception when it is invalid" do
    expect_raises(JWT::Errors::Expired, /Token has expired/) do
      JWT::Claims::Expiration.validate({"foo" => "bar", "exp" => Time.now.epoch - 60})
    end
  end

  it "returns nil when it is valid" do
    JWT::Claims::Expiration.validate({"foo" => "bar", "exp" => Time.now.epoch + 60}).should be_nil
  end

  it "returns nil when there's no exists" do
    JWT::Claims::Expiration.validate({"foo" => "bar"}).should be_nil
  end
end
