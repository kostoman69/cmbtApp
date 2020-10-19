class Posts {
  List<Post> data;

  Posts({this.data});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Post>();
      json['data'].forEach((v) {
        data.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String message;
  String id;
  String permalinkURL;
  String createdTime;
  String fullPicture;

  Post({this.message, this.id, this.fullPicture, this.permalinkURL, this.createdTime});

  Post.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    permalinkURL = json['permalink_url'];
    createdTime = json['created_time'];
    fullPicture = json['full_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['permalink_url'] = this.permalinkURL;
    data['created_time'] = this.createdTime;
    data['full_picture'] = this.fullPicture;
    return data;
  }
}
