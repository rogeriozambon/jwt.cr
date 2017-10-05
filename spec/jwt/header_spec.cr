require "../spec_helper"

describe JWT::Header do
  it "without algorithm" do
    header = JWT::Header.new(adapters["none"]).generate
    header.should eq("eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0")
  end

  it "with HS256 algorithm" do
    header = JWT::Header.new(adapters["hs256"]).generate
    header.should eq("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9")
  end

  it "with HS384 algorithm" do
    header = JWT::Header.new(adapters["hs384"]).generate
    header.should eq("eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9")
  end

  it "with HS512 algorithm" do
    header = JWT::Header.new(adapters["hs512"]).generate
    header.should eq("eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9")
  end
end
