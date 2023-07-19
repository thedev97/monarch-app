import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String password;
  dynamic lastLogin;
  bool isSuperuser;
  String firstName;
  String lastName;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String empId;
  String name;
  String email;
  dynamic mobile;
  dynamic invitationId;
  bool isMember;
  bool isVerified;
  dynamic dob;
  dynamic avatar;
  String gender;
  String state;
  String country;
  DateTime createdAt;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  UserModel({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.empId,
    required this.name,
    required this.email,
    this.mobile,
    required this.invitationId,
    required this.isMember,
    required this.isVerified,
    this.dob,
    required this.avatar,
    required this.gender,
    required this.state,
    required this.country,
    required this.createdAt,
    required this.groups,
    required this.userPermissions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        password: json["password"],
        lastLogin: json["last_login"] == null ? null : json["last_login"],
        isSuperuser: json["is_superuser"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        empId: json["emp_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        invitationId:
            json["invitation_id"] == null ? null : json["invitation_id"],
        isMember: json["is_member"],
        isVerified: json["is_verified"],
        dob: json["dob"] == null ? null : json["dob"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        gender: json["gender"],
        state: json["state"],
        country: json["country"],
        createdAt: DateTime.parse(json["created_at"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin ?? "",
        "is_superuser": isSuperuser,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "emp_id": empId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "invitation_id": invitationId,
        "is_member": isMember,
        "is_verified": isVerified,
        "dob": dob,
        "avatar": avatar,
        "gender": gender,
        "state": state,
        "country": country,
        "created_at": createdAt.toIso8601String(),
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
