require "./spec_helper"

describe JWT do
  describe "#encode" do
    it "with HS256" do
      token = JWT.encode({"email" => "john@exmaple.org"}, JWT::Adapters::HS256.new("secret"))
      token.should eq "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.c_uGDeYAuC9SP0gOHuV-4OPKO8yoyUtZYpeXboj9zfU"
    end

    it "with HS384" do
      token = JWT.encode({"email" => "john@exmaple.org"}, JWT::Adapters::HS384.new("secret"))
      token.should eq "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.D5kgVdX7fjVdtDxnk_8QlOAsMgJc56ONCcKkwaTC0vZltGPqle2p0Asloy3iIc1r"
    end

    it "with HS512" do
      token = JWT.encode({"email" => "john@exmaple.org"}, JWT::Adapters::HS512.new("secret"))
      token.should eq "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.gTJgk-OiE_rtwaH34slrSw_Eyg7uqEXhJFS_ABphLj2GxWC8ivL1zsqZEQQzcTNwSdqXa57nVOHDr8z7US5H4w"
    end
	end

	describe "#decode" do
	  it "verifies JWT" do
	    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.c_uGDeYAuC9SP0gOHuV-4OPKO8yoyUtZYpeXboj9zfU"
	    data = JWT.decode(token, JWT::Adapters::HS256.new("secret"))

			data.should eq({
				"header" => {"typ" => "JWT", "alg" => "HS256"},
				"payload" => {"email" => "john@exmaple.org"}
			})
	  end
	end
end

describe JWT::Adapters do
	it "returns an hs256 w/ base64 encrypted value" do
		value = JWT::Adapters::HS256.new("secret").sign("foo")
		value.should eq("dzukRpPHVT1u4g9h6l0nV6mk9KRNKEGuTpW1LkzWLbQ")
	end

	it "returns an hs384 w/ base64 encrypted value" do
		value = JWT::Adapters::HS384.new("secret").sign("foo")
		value.should eq("DttwaOy_TeLEe4gZ_VNDMzefII-YnFEBjQPuEVXkwHQKQY7CINQmDqvLLQkLFt5u")
	end

	it "returns an hs512 w/ base64 encrypted value" do
		value = JWT::Adapters::HS512.new("secret").sign("foo")
		value.should eq("gt9xA96Ngt5F4BxF_mQrXRPGwrR97K_rwAlDHGZcb6Xz0a9Ol46hvekUJmIgc-vqxho0Ye_UZ-CXHHiLyOvbvg")
	end
end
