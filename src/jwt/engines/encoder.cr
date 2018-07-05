module JWT::Engines::Encoder
  extend self

  def generate(payload : Hash, adapter : AdapterTypes)
    header = Header.generate(adapter)
    payload = Payload.generate(payload)
    signature = adapter.sign("#{header}.#{payload}")

    "#{header}.#{payload}.#{signature}"
  end
end
