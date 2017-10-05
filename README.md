# jwt.cr

[![Build Status](https://travis-ci.org/rogeriozambon/jwt.cr.svg?branch=master)](https://travis-ci.org/rogeriozambon/jwt.cr)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rogeriozambon/jwt.cr/master/LICENSE)

A simple [JWT](https://jwt.io/) implementation in Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  jwt:
    github: rogeriozambon/jwt.cr
```

## Usage

#### Encoding

```crystal
adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar"}

JWT.encode(payload, adapter)
#=> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIifQ.dtxWM6MIcgoeMgH87tGvsNDY6cHWL6MGW4LeYvnm1JA
```

#### Decoding

```crystal
adapter = JWT::Adapters::HS256.new("secret")
token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIifQ.dtxWM6MIcgoeMgH87tGvsNDY6cHWL6MGW4LeYvnm1JA"

JWT.decode(token, adapter)
#=> {{"alg" => "HS256", "typ" => "JWT"}, {"foo" => "bar"}}
```

## Algorithms
* [x] None
* [x] HMAC (HS256, HS384, HS512)
* [ ] RSA
* [ ] ECDSA

## Claims

#### Audience (aud)

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar", "aud" => ["guest", "visitor"]}

JWT.encode(payload, adapter)
#=> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJhdWQiOlsiZ3Vlc3QiLCJ2aXNpdG9yIl19.S5BkkjkhjagYET12wz4W2cF8ATF1iVfpJ9OvbjMdCRU

JWT.decode(token, adapter)
#=> {{"alg" => "HS256", "typ" => "JWT"}, {"foo" => "bar", "aud" => ["guest", "visitor"]}}
```

When an audience doesn't match with that was passed to payload, an exception (`JWT::Errors::Audience`) will be thrown.

```crystal
JWT.decode(token, adapter, {"aud" => "admin"})
#=> Invalid audience. (JWT::Errors::Audience)
```

#### Expiration (exp)

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar", "exp" => Time.now.epoch + 60}

JWT.encode(payload, adapter)
#=> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJleHAiOjE0MDcxNTMyMzF9.ClzhXRBkpaJZw1QscBT_CD8yA1IQmWOTaokQn4fIGFc

JWT.decode(token, adapter)
#=> {{"alg" => "HS256", "typ" => "JWT"}, {"foo" => "bar", "exp" => 1407153257}}
```

After 60 seconds, the token expires and an exception (`JWT::Errors::Expired`) will be thrown:

```crystal
JWT.decode(token, adapter)
#=> Token has expired. (JWT::Errors::Expired)
```

#### Issuer (iss)

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar", "iss" => "jwt.cr"}

JWT.encode(payload, adapter)
#=> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJpc3MiOiJqd3QuY3IifQ.4lj020gUcpRg0r_4n8L7ZSn28BcSWGBeF3I7BaBSDDY

JWT.decode(token, adapter)
#=> {{"alg" => "HS256", "typ" => "JWT"}, {"foo" => "bar", "iss" => "jwt.cr"}}
```

When an issuer doesn't match with that was passed to payload, an exception (`JWT::Errors::Issuer`) will be thrown.

```crystal
JWT.decode(token, adapter, {"iss" => "jwt"})
#=> Invalid issuer. (JWT::Errors::Issuer)
```

#### Not Before (nbf)

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar", "nbf" => Time.now.epoch + 60}

JWT.encode(payload, adapter)
#= > eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJuYmYiOjE0MDcxNTMyMDV9.s6PJj6dBxZPWpdzYjxw9h846x6IU05nRB41y43JNVMs
```

Before the 60 seconds ends, the token will not ready to use and an exception (`JWT::Errors::NotReady`) will be thrown:

```crystal
JWT.decode(token, adapter)
#=> Token not ready. (JWT::Errors::NotReady)
```

#### Subject (sub)

```crystal
require "jwt"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"foo" => "bar", "sub" => "github"}

JWT.encode(payload, adapter)
#=> eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJzdWIiOiJnaXRodWIifQ.7r7_7tV4xzrQN1atQ7OP7O7eRVtb1l37dIYBjv5yJvg

JWT.decode(token, adapter)
#=> {{"alg" => "HS256", "typ" => "JWT"}, {"foo" => "bar", "sub" => "github"}}
```

When a subject doesn't match with that was passed to payload, an exception (`JWT::Errors::Subject`) will be thrown.

```crystal
JWT.decode(token, adapter, {"sub" => "gitlab"})
#=> Invalid subject. (JWT::Errors::Subject)
```

## Specs

```
$ crystal spec
```

## Contributors

- [rogeriozambon](https://github.com/rogeriozambon) Rogério Zambon - creator, maintainer
