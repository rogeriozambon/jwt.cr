require "../spec_helper"

describe JWT::Payload do
  time = 42.to_i64

  context "generic types" do
    it "for strings => string" do
      payload = JWT::Payload.generate({"foo" => "bar"})
      payload.should eq("eyJmb28iOiJiYXIifQ")
    end

    it "for strings => int64" do
      payload = JWT::Payload.generate({"foo" => time})
      payload.should eq("eyJmb28iOjQyfQ")
    end

    it "for strings => hash of strings" do
      payload = JWT::Payload.generate({"foo" => {"bar" => "foo"}})
      payload.should eq("eyJmb28iOnsiYmFyIjoiZm9vIn19")
    end
  end

  context "specific types" do
    it "for strings => hash of strings | int64 | strings" do
      payload = JWT::Payload.generate({"foo" => {"bar" => "foo"}, "time" => time, "bar" => "foo"})
      payload.should eq("eyJmb28iOnsiYmFyIjoiZm9vIn0sInRpbWUiOjQyLCJiYXIiOiJmb28ifQ")
    end

    it "for strings => array of strings | hash of strings | strings" do
      payload = JWT::Payload.generate({"foo" => "bar", "bar" => ["foo", "oof"], "oof" => {"rab" => "bar"}})
      payload.should eq("eyJmb28iOiJiYXIiLCJiYXIiOlsiZm9vIiwib29mIl0sIm9vZiI6eyJyYWIiOiJiYXIifX0")
    end

    it "for strings => array of strings | hash of strings | int64 | strings" do
      payload = JWT::Payload.generate({"foo" => ["bar", "foo"], "bar" => {"foo" => "bar"}, "time" => time, "oof" => "rab"})
      payload.should eq("eyJmb28iOlsiYmFyIiwiZm9vIl0sImJhciI6eyJmb28iOiJiYXIifSwidGltZSI6NDIsIm9vZiI6InJhYiJ9")
    end
  end

  context "payload types" do
    it "for strings => array of strings | strings" do
      payload = JWT::Payload.generate({"foo" => ["bar", "foo"], "bar" => "foo"})
      payload.should eq("eyJmb28iOlsiYmFyIiwiZm9vIl0sImJhciI6ImZvbyJ9")
    end

    it "for strings => int64 | strings" do
      payload = JWT::Payload.generate({"foo" => "bar", "time" => time})
      payload.should eq("eyJmb28iOiJiYXIiLCJ0aW1lIjo0Mn0")
    end

    it "for strings => array of strings | int64 | strings" do
      payload = JWT::Payload.generate({"foo" => ["bar", "foo"], "time" => time, "bar" => "foo"})
      payload.should eq("eyJmb28iOlsiYmFyIiwiZm9vIl0sInRpbWUiOjQyLCJiYXIiOiJmb28ifQ")
    end
  end
end
