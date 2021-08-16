class OwnerModel {
  OwnerModel({
    this.login,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
  });

  String? login;
  String? avatarUrl;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;

  factory OwnerModel.fromJson(Map<String, dynamic> json) => OwnerModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
      );

  static List<OwnerModel>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => OwnerModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
      };
}
