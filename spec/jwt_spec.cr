require "./spec_helper"

describe JWT::Adapters do
  it "returns an pure base64 encrypted value" do
    value = adapters["none"].sign("foo")
    value.should eq("Zm9v")
  end

  it "returns an hs256 w/ base64 encrypted value" do
    value = adapters["hs256"].sign("foo")
    value.should eq("dzukRpPHVT1u4g9h6l0nV6mk9KRNKEGuTpW1LkzWLbQ")
  end

  it "returns an hs384 w/ base64 encrypted value" do
    value = adapters["hs384"].sign("foo")
    value.should eq("DttwaOy_TeLEe4gZ_VNDMzefII-YnFEBjQPuEVXkwHQKQY7CINQmDqvLLQkLFt5u")
  end

  it "returns an hs512 w/ base64 encrypted value" do
    value = adapters["hs512"].sign("foo")
    value.should eq("gt9xA96Ngt5F4BxF_mQrXRPGwrR97K_rwAlDHGZcb6Xz0a9Ol46hvekUJmIgc-vqxho0Ye_UZ-CXHHiLyOvbvg")
  end
end

describe JWT::Claims do
  describe JWT::Claims::Audience do
    it "throws an exception'" do
      payload = {"email" => "john@exmaple.org", "aud" => ["john", "jane"]}
      token = JWT.encode(payload, adapters["hs256"])

      expect_raises(JWT::Errors::Audience, /Invalid audience/) do
        JWT.decode(token, adapters["hs256"], {"aud" => "invalid"})
      end
    end
  end

  describe JWT::Claims::Expiration do
    it "throws an exception'" do
      payload = {"email" => "john@exmaple.org", "exp" => Time.now.epoch - 60}
      token = JWT.encode(payload, adapters["hs256"])

      expect_raises(JWT::Errors::Expired, /Token has expired/) do
        JWT.decode(token, adapters["hs256"])
      end
    end
  end

  describe JWT::Claims::Issuer do
    it "throws an exception'" do
      payload = {"email" => "john@exmaple.org", "iss" => "jwt.cr"}
      token = JWT.encode(payload, adapters["hs256"])

      expect_raises(JWT::Errors::Issuer, /Invalid issuer/) do
        JWT.decode(token, adapters["hs256"], {"iss" => "invalid"})
      end
    end
  end

  describe JWT::Claims::NotBefore do
    it "throws an exception'" do
      payload = {"email" => "john@exmaple.org", "nbf" => Time.now.epoch + 60}
      token = JWT.encode(payload, adapters["hs256"])

      expect_raises(JWT::Errors::NotReady, /Token not ready/) do
        JWT.decode(token, adapters["hs256"])
      end
    end
  end

  describe JWT::Claims::Subject do
    it "throws an exception'" do
      payload = {"email" => "john@exmaple.org", "sub" => "specs"}
      token = JWT.encode(payload, adapters["hs256"])

      expect_raises(JWT::Errors::Subject, /Invalid subject/) do
        JWT.decode(token, adapters["hs256"], {"sub" => "invalid"})
      end
    end
  end
end

describe JWT do
  describe "#encode" do
    it "with HS256" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["hs256"])
      token.should eq "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.ktVGv9VCzarV5Ujc-Ymf_7zhFbL93k_M2mlfAoz6804"
    end

    it "with HS384" do
      token = JWT.encode({"email" => "john@exmaple.org" }, adapters["hs384"])
      token.should eq "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.Q7AOHA8qeXLtzOpEvcsjzPJOWmu7COPLvkN2slLoVcJ9wnrQzObFq0Ig5gAfev6W"
    end

    it "with HS512" do
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
