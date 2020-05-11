import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PostsListView(),
    );
  }
}

class PostsListView extends StatefulWidget {
  @override
  _PostsListViewState createState() => _PostsListViewState();
}

Future<List<Post>> _fetchPosts() async {
  final jobsListAPIUrl =
      'https://graph.facebook.com/v7.0/me?fields=id,name,posts{full_picture,message}&access_token=EAADVjHZBuokEBAGLa86YfH2HZAdJ2f5d802G6ZCY5VPNWfhl3TyHYpjPV6Tv5dhZAMfcuZAeKaa9lvpwtmcDtXlWT1Xy4VitAoHV4WBgjcdZBVmcAw2YdKkLTZB43BYuhTlBzZCYz55CZCtsnem7nctnPkI796ZAVwfXa1BFaSoSEolHZC2NXF7R9xo';
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    FacebookWall fbWall = FacebookWall.fromJson(json.decode(response.body));
    return fbWall.posts.data;
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

Widget _postTile(String message, String imageURL) => IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 70.0,
            height: 60.0,
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
            ),
            child: Image.network(
              imageURL,
            ),
          ),
          SizedBox(height: 60.0, width: 5.0),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
              ),
              child: Text(message),
            ),
          ),
        ],
      ),
    );

ListView _postsListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => _postTile(
          data[index].message == null ? " " : data[index].message,
          data[index].fullPicture == null ? " " : data[index].fullPicture));
}

class _PostsListViewState extends State<PostsListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          leading: IconButton(
            icon: Image.asset('assets/cmbt.png'), 
            onPressed: () { },
          ),
        ),
        body: FutureBuilder<List<Post>>(
          future: _fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> data = snapshot.data;
              return _postsListView(data
                  .where((p) => p.fullPicture != null && p.message != null)
                  .toList());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class FacebookWall {
  String id;
  String name;
  Posts posts;

  FacebookWall({this.id, this.name, this.posts});

  FacebookWall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    return data;
  }
}

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
  String fullPicture;

  Post({this.message, this.id, this.fullPicture});

  Post.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    fullPicture = json['full_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['full_picture'] = this.fullPicture;
    return data;
  }
}
