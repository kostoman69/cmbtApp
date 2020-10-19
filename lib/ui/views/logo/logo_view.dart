import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import 'logo_viewmodel.dart';

class LogoView extends StatelessWidget {
  LogoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogoViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBarWithHeight(
            height: 120.0,
            title: model.title,
          ),
          body: _buildBoby(model),
        ),
      ),
      viewModelBuilder: () => LogoViewModel(),
    );
  }

  Widget _buildBoby(LogoViewModel model) {
    final _titleStyle = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.orange,
      shadows: [
        Shadow(
          blurRadius: 10.0,
          color: Colors.black,
          offset: Offset(10.0, 10.0),
        ),
      ],
    );
    final _titleStyleL = TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.bold,
      color: Colors.orange,
      shadows: [
        Shadow(
          blurRadius: 10.0,
          color: Colors.black,
          offset: Offset(10.0, 10.0),
        ),
      ],
    );

    if (model.hasError) {
      return Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          model.modelError,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else if (model.isBusy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              // If your background video doesn't look right, try changing the BoxFit property.
              // BoxFit.fill created the look I was going for.
              fit: BoxFit.fill,
              child: SizedBox(
                width: model.controller.value.size?.width ?? 0,
                height: model.controller.value.size?.height ?? 0,
                child: VideoPlayer(model.controller),
              ),
            ),
          ),
          Container(
            alignment: Alignment(1, 0.6),
            child: Container(
              padding: EdgeInsets.only(right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FloatingActionButton(onPressed: () => model.showConfirmationDialog()),
                  Container(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(model.result ? "C" : "X", style: _titleStyleL),
                      Text("retan", style: _titleStyle),
                    ],
                  )),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("M", style: _titleStyleL),
                          Text("ountain", style: _titleStyle),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("B", style: _titleStyleL),
                          Text("ike", style: _titleStyle),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("T", style: _titleStyleL),
                          Text("rails", style: _titleStyle),
                        ],
                      )),
                ],
              ),
              //padding: EdgeInsets.only(left: 50),
            ),
          ),
        ],
      );
    }
  }
}

class AppBarWithHeight extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const AppBarWithHeight({Key key, @required this.height, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        color: Colors.blueGrey[800],
        padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cmbt.png',
              fit: BoxFit.contain,
              height: 80,
            ),
            Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  this.title,
                  style: TextStyle(fontSize: 17.0),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
