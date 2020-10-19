import 'package:cmbt/datamodels/post.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'news_viewmodel.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('News'),
            leading: IconButton(
              icon: Image.asset('assets/cmbt.png'),
              onPressed: () {},
            ),
          ),
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : !model.hasError ? _posts2ListView(model.data.where((p) => p.fullPicture != null || p.message != null).toList()) : null,
        ),
      ),
      viewModelBuilder: () => NewsViewModel(),
    );
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
        itemBuilder: (context, index) => _postTile(data[index].message == null ? " " : data[index].message, data[index].fullPicture == null ? " " : data[index].fullPicture));
  }

  ListView _posts2ListView(data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        String message = data[index].message == null ? " " : data[index].message;
        String imageURL = data[index].fullPicture == null ? " " : data[index].fullPicture;
        String createdTime = data[index].createdTime;
        String permalinkURL = data[index].permalinkURL;

        return ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: NetworkImage(imageURL),
          // ),
          leading: ClipRect(
            child: Image.network(
              imageURL,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          //Image.asset(profileImage, fit: BoxFit.cover),

          title: Text(DateFormat('dd MMMM yyyy').format(DateTime.parse(createdTime))),
          subtitle: Text(message),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () async {
            String fbProtocolUrl;
            //if (Platform.isIOS) {
            //  fbProtocolUrl = 'fb://profile/page_id';
            //} else {
            //          fbProtocolUrl = 'fb://page/page_id';
            //}
            //
            //          String fallbackUrl = 'https://www.facebook.com/page_name';

            try {
              bool launched = await launch(permalinkURL, forceSafariVC: false);

              // if (!launched) {
              //   await launch(fallbackUrl, forceSafariVC: false);
              // }
            } catch (e) {
              //await launch(fallbackUrl, forceSafariVC: false);
            }
          },
          dense: false,
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
