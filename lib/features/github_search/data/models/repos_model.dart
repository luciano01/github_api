import 'package:github_api/features/github_search/domain/entities/repos.dart';

class ReposModel extends Repos {
  ReposModel({
    required String fullName,
    required String description,
    required String language,
    required int forksCount,
  }) : super(
          fullName: fullName,
          description: description,
          language: language,
          forksCount: forksCount,
        );

  factory ReposModel.fromJson(Map<String, dynamic> json) {
    return ReposModel(
      fullName: json['full_name'],
      description: json['description'],
      language: json['language'],
      forksCount: json['forks_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "description": description,
      "language": language,
      "forks_count": forksCount,
    };
  }

  static List<ReposModel> fromJsonList(List list) {
    return list.map((value) => ReposModel.fromJson(value)).toList();
  }
}
