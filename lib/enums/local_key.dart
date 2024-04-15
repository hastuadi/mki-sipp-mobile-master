enum SharedPrefs {
  isLogin, token
}

extension LocalKeyString on SharedPrefs {
  String get key {
    switch(this) {
      case SharedPrefs.isLogin:
        return "isLogin";
      case SharedPrefs.token:
        return "token";
    }
  }
}