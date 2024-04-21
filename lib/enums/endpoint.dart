enum Endpoint {
  login, createUser, logout, researchList, researchResult
}

extension RawString on Endpoint {
  String get getString {
    switch(this) {
      case Endpoint.login:
        return "/user/login";
      case Endpoint.createUser:
        return "/user/create_user";
      case Endpoint.logout:
        return "/user/logout";
      case Endpoint.researchList:
        return "/image/research_list";
      case Endpoint.researchResult:
        return "/image/detection_result";
    }
  }
}