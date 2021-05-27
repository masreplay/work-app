import 'package:json_annotation/json_annotation.dart';

part 'list_my_work.g.dart';

@JsonSerializable()
class ListMyWork {
  @JsonKey(name: 'items')
  final List<Item> items;

  ListMyWork({required this.items});

  factory ListMyWork.fromJson(Map<String, dynamic> json) =>
      _$ListMyWorkFromJson(json);

  Map<String, dynamic> toJson() => _$ListMyWorkToJson(this);
}

@JsonSerializable()
class Item {
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
  @JsonKey(name: 'works')
  final List<Work> works;

  Item({
    required this.id,
    required this.fullName,
    required this.username,
    required this.phone,
    required this.img,
    required this.depId,
    required this.status,
    required this.salary,
    required this.managerName,
    required this.isEmployee,
    required this.isManager,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.works,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Work {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'repeater_id')
  final int? repeaterId;
  @JsonKey(name: 'agent_id')
  final int? agentId;
  @JsonKey(name: 'work_details')
  final String workDetails;
  @JsonKey(name: 'time_in')
  final String? timeIn;
  @JsonKey(name: 'time_out')
  final String? timeOut;
  @JsonKey(name: 'details')
  final String? details;
  @JsonKey(name: 'img')
  final String? img;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'pivot')
  final Pivot pivot;
  @JsonKey(name: 'repeaters')
  final Repeaters? repeaters;
  @JsonKey(name: 'users')
  final Users? users;
  @JsonKey(name: 'employee')
  final List<Employee>? employee;

  Work({
    required this.id,
    required this.userId,
    required this.repeaterId,
    required this.agentId,
    required this.workDetails,
    required this.timeIn,
    required this.timeOut,
    required this.details,
    required this.img,
    required this.status,
    required this.createdDate,
    required this.pivot,
    required this.repeaters,
    required this.users,
    required this.employee,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'daily_work_id')
  final int dailyWorkId;

  Pivot({required this.userId, required this.dailyWorkId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

@JsonSerializable()
class Repeaters {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'lat')
  final String lat;
  @JsonKey(name: 'log')
  final String log;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Repeaters({
    required this.id,
    required this.name,
    required this.city,
    required this.lat,
    required this.log,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Repeaters.fromJson(Map<String, dynamic> json) =>
      _$RepeatersFromJson(json);

  Map<String, dynamic> toJson() => _$RepeatersToJson(this);
}

@JsonSerializable()
class Users {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'username')
  final String? username;
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
  @JsonKey(name: 'agent')
  final List<Agent>? agent;
  @JsonKey(name: 'department')
  final Department department;

  Users({
    required this.id,
    required this.fullName,
    required this.username,
    required this.phone,
    required this.img,
    required this.depId,
    required this.status,
    required this.salary,
    required this.managerName,
    required this.isEmployee,
    required this.isManager,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.agent,
    required this.department,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable()
class Agent {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'repeaters_id')
  final int repeatersId;
  @JsonKey(name: 'ccr_id')
  final String? ccrId;
  @JsonKey(name: 'details')
  final String? details;
  @JsonKey(name: 'user_resalar')
  final String userResalar;
  @JsonKey(name: 'distance')
  final String? distance;
  @JsonKey(name: 'number_users')
  final int numberUsers;
  @JsonKey(name: 'link_ip_master')
  final String? linkIpMaster;
  @JsonKey(name: 'link_ip_slave')
  final String? linkIpSlave;
  @JsonKey(name: 'link_type')
  final String linkType;
  @JsonKey(name: 'log')
  final String log;
  @JsonKey(name: 'lat')
  final String lat;
  @JsonKey(name: 'back_up')
  final String backUp;
  @JsonKey(name: 'join_date')
  final String joinDate;
  @JsonKey(name: 'port')
  final String? port;
  @JsonKey(name: 'is_fiber')
  final String isFiber;
  @JsonKey(name: 'to_company')
  final String? toCompany;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'repeaters')
  final Repeaters repeaters;

  Agent(
      {required this.id,
      required this.userId,
      required this.repeatersId,
      required this.ccrId,
      required this.details,
      required this.userResalar,
      required this.distance,
      required this.numberUsers,
      required this.linkIpMaster,
      required this.linkIpSlave,
      required this.linkType,
      required this.log,
      required this.lat,
      required this.backUp,
      required this.joinDate,
      required this.port,
      required this.isFiber,
      required this.toCompany,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      required this.repeaters});

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
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

@JsonSerializable()
class Employee {
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

  Employee(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.phone,
      required this.img,
      required this.depId,
      required this.status,
      required this.salary,
      required this.managerName,
      required this.isEmployee,
      required this.isManager,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      required this.department});

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
