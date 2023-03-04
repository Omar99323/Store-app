class LoginResponseModel {
  final bool status;
  final String message;
  final dynamic data;

  LoginResponseModel({
    required this.status,
    required this.message,
     this.data,
  });

  factory LoginResponseModel.fromjson(json) {
    return LoginResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginUserModel.fromjson(json['data']) : null,
    );
  }
}

class LoginUserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  LoginUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  factory LoginUserModel.fromjson(json) {
    return LoginUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }
}
