class RegisterRequest {
  String? fullName;
  String? email;
  String? password;

  RegisterRequest({this.fullName, this.email, this.password});

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "password": password
  };

}