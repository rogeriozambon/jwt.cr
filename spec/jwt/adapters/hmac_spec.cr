require "../../spec_helper"

describe JWT::Adapters::HS256 do
  it "returns hs256 with base64 encrypted value" do
    value = adapters["hs256"].sign("foo")
    value.should eq("dzukRpPHVT1u4g9h6l0nV6mk9KRNKEGuTpW1LkzWLbQ")
  end
end

describe JWT::Adapters::HS384 do
  it "returns a hs384 with base64 encrypted value" do
    value = adapters["hs384"].sign("foo")
    value.should eq("DttwaOy_TeLEe4gZ_VNDMzefII-YnFEBjQPuEVXkwHQKQY7CINQmDqvLLQkLFt5u")
  end
end

describe JWT::Adapters::HS512 do
  it "returns a hs512 with base64 encrypted value" do
    value = adapters["hs512"].sign("foo")
    value.should eq("gt9xA96Ngt5F4BxF_mQrXRPGwrR97K_rwAlDHGZcb6Xz0a9Ol46hvekUJmIgc-vqxho0Ye_UZ-CXHHiLyOvbvg")
  end
end
