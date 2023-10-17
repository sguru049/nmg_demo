import 'dart:convert';

PostDetails postDetailsFromJson(String str) => PostDetails.fromJson(json.decode(str));

String postDetailsToJson(PostDetails data) => json.encode(data.toJson());

class PostDetails {
    final int userId;
    final int id;
    final String title;
    final String body;

    PostDetails({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostDetails.fromJson(Map<String, dynamic> json) => PostDetails(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}