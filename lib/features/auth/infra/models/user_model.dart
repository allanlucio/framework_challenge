import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String name, required String email})
      : super(email: email, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json["name"], email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "name": name};
  }
}
