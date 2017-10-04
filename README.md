# jwt.cr

[![Build Status](https://travis-ci.org/rogeriozambon/jwt.cr.svg?branch=master)](https://travis-ci.org/rogeriozambon/jwt.cr)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rogeriozambon/jwt.cr/master/LICENSE)

JWT implementation in Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  jwt.cr:
    github: rogeriozambon/jwt.cr
```

## Usage

```crystal
require "jwt.cr"

adapter = JWT::Adapters::HS256.new("secret")
payload = {"email" => "john@exmaple.org"}

token = JWT.encode({"email" => "john@exmaple.org"}, adapter)
data = JWT.decode(token, adapter)
```

## Contributors

- [rogeriozambon](https://github.com/rogeriozambon) Rogério Zambon - creator, maintainer
