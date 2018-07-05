require "../../spec_helper"

describe JWT::Claims::Subject do
  it "throws an exception when it is invalid" do
    expect_raises(JWT::Errors::Subject, /Invalid subject/) do
      JWT::Claims::Subject.validate({"foo" => "bar", "sub" => "specs"}, {"sub" => "invalid"})
    end
  end

  it "returns nil when it is valid" do
    JWT::Claims::Subject.validate({"foo" => "bar", "sub" => "specs"}, {"sub" => "specs"}).should be_nil
  end

  it "returns nil when there's no exists" do
    JWT::Claims::Subject.validate({"foo" => "bar"}, {"sub" => "specs"}).should be_nil
  end
end
