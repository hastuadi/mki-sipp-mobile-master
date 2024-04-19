enum Endpoint {
  login, researchList, researchResult
}

extension RawString on Endpoint {
  String get getString {
    switch(this) {
      case Endpoint.login:
        return "/user/login";
      case Endpoint.researchList:
        return "/image/research_list";
      case Endpoint.researchResult:
        return "/image/detection_result";
    }
  }
}