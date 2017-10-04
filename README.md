# jwt.cr

[![Build Status](https://travis-ci.org/rogeriozambon/jwt.cr.svg?branch=master)](https://travis-ci.org/rogeriozambon/jwt.cr)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rogeriozambon/jwt.cr/master/LICENSE)

Simple JWT implementation in Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  jwt:
    github: rogeriozambon/jwt.cr
```

## Usage

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"email" => "john@exmaple.org"}

token = JWT.encode(payload, adapter)
#=> eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZXhtYXBsZS5vcmcifQ.c_uGDeYAuC9SP0gOHuV-4OPKO8yoyUtZYpeXboj9zfU

data = JWT.decode(token, adapter)
#=> {"header" => {"typ" => "JWT", "alg" => "HS256"}, "payload" => {"email" => "john@exmaple.org"}}
```

## Contributors

- [rogeriozambon](https://github.com/rogeriozambon) Rogério Zambon - creator, maintainer
