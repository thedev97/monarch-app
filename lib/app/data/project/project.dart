import 'dart:convert';

ProjectListModel projectListModelFromJson(String str) =>
    ProjectListModel.fromJson(json.decode(str));

String projectListModelToJson(ProjectListModel data) =>
    json.encode(data.toJson());

class ProjectListModel {
  String status;
  int total;
  int page;
  int lastPage;
  List<Project> project;

  ProjectListModel({
    required this.status,
    required this.total,
    required this.page,
    required this.lastPage,
    required this.project,
  });

  factory ProjectListModel.fromJson(Map<String, dynamic> json) =>
      ProjectListModel(
        status: json["status"],
        total: json["total"],
        page: json["page"],
        lastPage: json["last_page"],
        project:
            List<Project>.from(json["project"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "page": page,
        "last_page": lastPage,
        "project": List<dynamic>.from(project.map((x) => x.toJson())),
      };
}

class Project {
  int id;
  String projectTitle;
  int primaryMember;
  List<int> teamMember;
  String des;
  String category;

  Project({
    required this.id,
    required this.projectTitle,
    required this.primaryMember,
    required this.teamMember,
    required this.des,
    required this.category,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
        "team_member": List<dynamic>.from(teamMember.map((x) => x)),
        "des": des,
        "category": category,
      };
}
