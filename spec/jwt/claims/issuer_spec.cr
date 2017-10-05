require "../../spec_helper"

describe JWT::Claims::Issuer do
  it "throws an exception when it is invalid" do
    expect_raises(JWT::Errors::Issuer, /Invalid issuer/) do
      JWT::Claims::Issuer.new({"foo" => "bar", "iss" => "jwt.cr"}, {"iss" => "invalid"}).validate
    end
  end

  it "returns nil when it is valid" do
    JWT::Claims::Issuer.new({"foo" => "bar", "iss" => "jwt.cr"}, {"iss" => "jwt.cr"}).validate.should be_nil
  end

  it "returns nil when there's no exists" do
    JWT::Claims::Issuer.new({"foo" => "bar"}, {"iss" => "jwt.cr"}).validate.should be_nil
  end
end
