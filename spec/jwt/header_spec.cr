require "../spec_helper"

describe JWT::Header do
  it "without algorithm" do
    header = JWT::Header.generate(adapters["none"])
    header.should eq("eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0")
  end

  it "with HS256 algorithm" do
    header = JWT::Header.generate(adapters["hs256"])
    header.should eq("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9")
  end

  it "with HS384 algorithm" do
    header = JWT::Header.generate(adapters["hs384"])
    header.should eq("eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9")
  end

  it "with HS512 algorithm" do
    header = JWT::Header.generate(adapters["hs512"])
    header.should eq("eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9")
  end
end
