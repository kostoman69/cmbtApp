import 'post.dart';

class FacebookWall {
  String id;
  String name;
  String link;
  Posts posts;

  FacebookWall({this.id, this.name, this.link, this.posts});

  FacebookWall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    return data;
  }
}

