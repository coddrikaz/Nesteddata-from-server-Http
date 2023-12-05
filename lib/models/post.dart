import 'dart:convert';

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  //Converts the json object to seperate data
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  //Not used in the code
  // Map<String, dynamic> toJson() => {
  //     "userId": userId,
  //     "id": id,
  //     "title": title,
  //     "body": body,
  // };
}

//reiterate our json object into a map of values
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

//Not used in the code
//String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
