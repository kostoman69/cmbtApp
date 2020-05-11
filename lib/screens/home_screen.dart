import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/waterfall.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        extendBodyBehindAppBar: true,
     //   appBar: CustomRoundedAppBar(100.0, "kakak"),
//         AppBar(
// //        backgroundColor: Colors.transparent,
//         backgroundColor: Color(0x44000000),
//         elevation: 0,
//         title: Text("Title"),
//       ),
          appBar: AppBarWithHeight(
            height: 150.0,
            title: 'Asterousia Trails',
          ),
          body: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class AppBarWithHeight extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const AppBarWithHeight({Key key, @required this.height,@required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
          child: Container(
        color: Colors.blueGrey[800],
//color: Color(0x44000000),
//         elevation: 0,
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cmbt.png',
              fit: BoxFit.contain,
              height: 90,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
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



class CustomRoundedAppBar extends StatelessWidget {
  double height = 100;
  final String title;

  CustomRoundedAppBar(
    this.height,
    this.title);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(this.height, this.height),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: this.height,
        child: new LayoutBuilder(builder: (context, constraint){
          final width =constraint.maxWidth * 8;
          return new ClipRect(
          child: Stack(
            children: <Widget>[
              new OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: new SizedBox(
                  width: width,
                  height: width,
                  child: new Padding(
                    padding: new EdgeInsets.only(
                      bottom: width / 2 - this.height / 3
                      ),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle,
                        boxShadow: [
                          new BoxShadow(color: Colors.black54, blurRadius: 10.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new Center(
                child: new Text("${this.title}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 10.0)
                    ]
                  ),
                )
              ),
            ],
          )
        );
        })
      ),
    );
  }
}