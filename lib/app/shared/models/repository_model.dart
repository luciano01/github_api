import 'package:github_api/app/shared/models/owner_model.dart';

class RepositoryModel {
  RepositoryModel({
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.language,
    this.owner,
  });

  String? name;
  String? fullName;
  bool? private;
  String? htmlUrl;
  String? description;
  String? language;
  OwnerModel? owner;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        language: json["language"],
        owner: OwnerModel.fromJson(json["owner"]),
      );

  static List<RepositoryModel>? fromJsonList(List list) {
    return list.map((item) => RepositoryModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "language": language,
        "owner": owner?.toJson(),
      };
}
