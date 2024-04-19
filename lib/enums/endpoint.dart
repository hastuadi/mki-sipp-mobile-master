enum Endpoint {
  login, researchList
}

extension RawString on Endpoint {
  String get getString {
    switch(this) {
      case Endpoint.login:
        return "/user/login";
      case Endpoint.researchList:
        return "/image/research_list";
    }
  }
}