class ForgetpasswordUserParams {
  final String email;

  ForgetpasswordUserParams({required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }
}