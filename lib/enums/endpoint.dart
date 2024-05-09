enum Endpoint {
  login, createUser, logout, researchList, researchResult,
  detectionImage, saveResult
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
      case Endpoint.detectionImage:
        return "/image/detection_v2";
      case Endpoint.saveResult:
        return "/image/add_master_image_metadata";
    }
  }
}