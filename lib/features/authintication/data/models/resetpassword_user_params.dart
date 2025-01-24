class ResetpasswordUserParams {
  final String password;

  ResetpasswordUserParams({required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }
}

