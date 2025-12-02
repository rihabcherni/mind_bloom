class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userType;
  final String? token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userType,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      userType: json['userType'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userType': userType,
      'token': token,
    };
  }

  String get fullName => '$firstName $lastName';
  bool get isDoctor => userType == 'doctor';
  bool get isParent => userType == 'parent';
}