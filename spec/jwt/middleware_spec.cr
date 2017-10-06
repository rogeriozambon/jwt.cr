require "../spec_helper"

describe JWT::Middleware do
  context = context_for_tests

  adapter = JWT::Adapters::None.new
  middleware = JWT::Middleware.new(adapter)

  Spec.before_each do
    context = context_for_tests
  end

  it "accepts requests with OPTIONS method" do
    context.request.method = "OPTIONS"

    middleware.call(context)
    context.response.status_code.should eq(404)
  end

  it "denies requests without Authorization header" do
    middleware.call(context)
    context.response.status_code.should eq(403)
  end

  it "denies requests without Authorization value" do
    context.request.headers.add("Authorization", "")

    middleware.call(context)
    context.response.status_code.should eq(403)
  end

  it "denies requests without a valid Authorization" do
    context.request.headers.add("Authorization", "Bearer")

    middleware.call(context)
    context.response.status_code.should eq(403)
  end

  it "denies requests without a correct Authorization token" do
    context.request.headers.add("Authorization", "Bearer eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ")

    middleware.call(context)
    context.response.status_code.should eq(403)
  end

  it "denies requests without a valid Authorization token" do
    context.request.headers.add("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiZ3Vlc3QiLCJ2aXNpdG9yIl0sImV4cCI6MTUwNzI0NjY3MiwiaXNzIjoiand0LmNyIiwic3ViIjoiZ2l0aHViIiwidXNlciI6eyJyZWZlcmVuY2UiOiJiZmQ0NWUyMi1kYjhhLTRiMTAtODJjMi1kOGQ4YmNjOGI2ZGIiLCJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifX0.b9OPqgcPzloQ87AMiX4rgg3Ho-9jkzMM3FLB4DirGv8")

    middleware.call(context)
    context.response.status_code.should eq(403)
  end

  it "accepts requests with valid Authorization token" do
    context.request.headers.add("Authorization", "Bearer eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.ZXlKaGJHY2lPaUp1YjI1bElpd2lkSGx3SWpvaVNsZFVJbjAuZXlKbGJXRnBiQ0k2SW1wdmFHNUFaWGh0WVhCc1pTNXZjbWNpZlE")

    middleware.call(context)
    context.response.status_code.should eq(404)
  end
end
