import 'dart:convert';

class AddProjectModel {
  int? id;
  String? projectTitle;
  int? primaryMember;
  List<int>? teamMember;
  String? des;
  String? category;

  AddProjectModel({
    this.id,
    this.projectTitle,
    this.primaryMember,
    this.teamMember,
    this.des,
    this.category,
  });

  factory AddProjectModel.fromRawJson(String str) => AddProjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddProjectModel.fromJson(Map<String, dynamic> json) => AddProjectModel(
    id: json["id"],
    projectTitle: json["project_title"],
    primaryMember: json["primary_member"],
    teamMember: List<int>.from(json["team_member"].map((x) => x)),
    des: json["des"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_title": projectTitle,
    "primary_member": primaryMember,
    "team_member": List<dynamic>.from(teamMember!.map((x) => x)),
    "des": des,
    "category": category,
  };
}
