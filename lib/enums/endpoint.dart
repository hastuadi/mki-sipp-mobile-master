enum Endpoint {
  login
}

extension RawString on Endpoint {
  String get getString {
    switch(this) {
      case Endpoint.login:
        return "/user/login";
    }
  }
}