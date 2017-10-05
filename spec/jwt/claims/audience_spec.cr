require "../../spec_helper"

describe JWT::Claims::Audience do
  it "throws an exception when it is invalid" do
    expect_raises(JWT::Errors::Audience, /Invalid audience/) do
      JWT::Claims::Audience.new({"foo" => "bar", "aud" => ["guest"]}, {"aud" => "invalid"}).validate
    end
  end

  it "returns nil when it is valid" do
    JWT::Claims::Audience.new({"foo" => "bar", "aud" => ["guest"]}, {"aud" => "guest"}).validate.should be_nil
  end

  it "returns nil when there's no exists" do
    JWT::Claims::Audience.new({"foo" => "bar"}, {"aud" => "guest"}).validate.should be_nil
  end
end
