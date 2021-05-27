import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'message')
  final Message message;

  LoginResponse({required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Message {
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'userData')
  final UserData userData;

  Message({required this.token, required this.userData});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'img')
  final String? img;
  @JsonKey(name: 'dep_id')
  final int depId;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'salary')
  final int salary;
  @JsonKey(name: 'manager_name')
  final String? managerName;
  @JsonKey(name: 'is_employee')
  final int isEmployee;
  @JsonKey(name: 'is_manager')
  final bool isManager;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'department')
  final Department department;

  UserData(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.phone,
      this.img,
      required this.depId,
      required this.status,
      required this.salary,
      this.managerName,
      required this.isEmployee,
      required this.isManager,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      required this.department});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Department {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  Department({required this.id, required this.name});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
