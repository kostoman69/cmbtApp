import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cmbt/datamodels/fb_wall.dart';
import 'package:cmbt/datamodels/post.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FbPostsService {
  Future<List<Post>> fetchPosts() async {
    final jobsListAPIUrl =
        'https://graph.facebook.com/v7.0/me?fields=id,name,link,posts{full_picture,message,permalink_url,created_time}&access_token=EAADVjHZBuokEBAGLa86YfH2HZAdJ2f5d802G6ZCY5VPNWfhl3TyHYpjPV6Tv5dhZAMfcuZAeKaa9lvpwtmcDtXlWT1Xy4VitAoHV4WBgjcdZBVmcAw2YdKkLTZB43BYuhTlBzZCYz55CZCtsnem7nctnPkI796ZAVwfXa1BFaSoSEolHZC2NXF7R9xo';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      FacebookWall fbWall = FacebookWall.fromJson(json.decode(response.body));
      return fbWall.posts.data;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
