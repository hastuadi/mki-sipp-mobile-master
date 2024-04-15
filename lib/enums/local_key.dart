enum SharedPrefs {
  isLogin, token, fullName, email
}

extension LocalKeyString on SharedPrefs {
  String get key {
    switch(this) {
      case SharedPrefs.isLogin:
        return "isLogin";
      case SharedPrefs.token:
        return "token";
      case SharedPrefs.fullName:
        return "name";
      case SharedPrefs.email:
        return "email";
    }
  }
}