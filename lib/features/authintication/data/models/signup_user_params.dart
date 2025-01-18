class SignupUserParams {
  final String email;
  final String password;
  final String role;
  final String name;

  SignupUserParams({required this.email, required this.password, required this.role, required this.name});

  Map<String, dynamic> toMap()  {
   return <String, dynamic>{
     'email': email,
     'password': password,
     'role': role,
     'name': name
   };
  }
}