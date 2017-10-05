require "./spec_helper"

describe JWT do
  describe "#encode" do
    it "with none algorithm" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["none"])
      token.should eq "eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.ZXlKaGJHY2lPaUp1YjI1bElpd2lkSGx3SWpvaVNsZFVJbjAuZXlKbGJXRnBiQ0k2SW1wdmFHNUFaWGh0WVhCc1pTNXZjbWNpZlE"
    end

    it "with HS256 algorithm" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["hs256"])
      token.should eq "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.ktVGv9VCzarV5Ujc-Ymf_7zhFbL93k_M2mlfAoz6804"
    end

    it "with HS384 algorithm" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["hs384"])
      token.should eq "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.Q7AOHA8qeXLtzOpEvcsjzPJOWmu7COPLvkN2slLoVcJ9wnrQzObFq0Ig5gAfev6W"
    end

    it "with HS512 algorithm" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["hs512"])
      token.should eq "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.LQLLtHqPwFZYLmRETWHrOTUsAS8_9MbIB5x4QxdGwFGKuJjV-BD9zP1F-n8wmZIW7qCb4yg_bc1BSYTN-aSnZw"
    end
  end

  describe "#decode" do
    it "verifies JWT" do
      token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.ktVGv9VCzarV5Ujc-Ymf_7zhFbL93k_M2mlfAoz6804"
      header, payload = JWT.decode(token, adapters["hs256"])

      header.should eq({"typ" => "JWT", "alg" => "HS256"})
      payload.should eq({"email" => "john@exmaple.org"})
    end
  end
end
